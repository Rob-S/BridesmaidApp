
#import "TasksTableViewController.h"
#import "EditTaskViewController.h"
#import "BridesmaidsAppDelegate.h"

@interface TasksTableViewController ()

@end

@implementation TasksTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
   [super viewDidLoad];

   self.title = @"Tasks";
   self.tableView.delegate = self;
   self.tableView.dataSource = self;
//   self.tableView.allowsSelectionDuringEditing = YES;

   self.navigationItem.leftBarButtonItem = self.editButtonItem;
   
}

- (void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];

   [self.tableView reloadData];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   NSArray * events = [self.data objectForKey:@"events"];
   return events.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   NSDictionary * event = [[self.data objectForKey:@"events"] objectAtIndex:section];
   return [event objectForKey:@"event"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   NSArray * events = [self.data objectForKey:@"events"];
   NSArray * tasks = [[events objectAtIndex:section] objectForKey:@"tasks"];
   return tasks.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
   cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

   NSArray * events = [self.data objectForKey:@"events"];
   NSDictionary * event = [events objectAtIndex:indexPath.section];
   NSArray * tasks = [event objectForKey:@"tasks"];

   NSString * cellIdentifier = @"cell";
/* IMPL: iOS dequeue... method requires registerClass:forCellReuseIdentifier:
   but cell is initialized with hard-coded style UITableViewCellStyleDefault
   UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
*/
   UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   if (! cell) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
   }

   if (indexPath.row >= tasks.count) {

// TO DO: "Add" for Bride, MoH; "Suggest" for other bridesmaids

      cell.textLabel.text = @"Add/Suggest another task";
      cell.detailTextLabel.text = @"";

      cell.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
      cell.imageView.image = [UIImage imageNamed:@"plus-sign-yellow.png"];

   }
   else {

      NSDictionary * task = [tasks objectAtIndex:indexPath.row];
      cell.textLabel.text = [task objectForKey:@"task"];
      if ([task objectForKey:@"names"]) {
         cell.detailTextLabel.text =  [task objectForKey:@"names"];
      }
      else {
         cell.detailTextLabel.text =  @"";
      }
      
// TO DO: if wanted, set color and icon from status in database

      UIColor * cellColor = indexPath.row % 2
         ? [UIColor colorWithRed:0.9 green:0.9 blue:0.0 alpha:1.0] // yellow
         : [UIColor colorWithRed:0.0 green:0.8 blue:0.0 alpha:1.0]; // green
      cell.backgroundColor = cellColor;
      
      cell.imageView.image = indexPath.row % 2
         ? [UIImage imageNamed:@"circular-yellow-glow-transparent.png"]
         : [UIImage imageNamed:@"status-circle-green-check.png"];

   }

   return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
   editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSArray * events = [self.data objectForKey:@"events"];
   NSDictionary * event = [events objectAtIndex:indexPath.section];
   NSArray * tasks = [event objectForKey:@"tasks"];
   return indexPath.row >= tasks.count ? UITableViewCellEditingStyleInsert
      : UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSLog(@"selected section #%d row #%d", indexPath.section, indexPath.row);

   NSArray * events = [self.data objectForKey:@"events"];
   NSDictionary * event = [events objectAtIndex:indexPath.section];
   NSArray * tasks = [event objectForKey:@"tasks"];

   if (indexPath.row >= tasks.count) {
      EditTaskViewController * etvc = [[EditTaskViewController alloc] init];
      [self.navigationController pushViewController:etvc animated:YES];
   }

}

- (void)tableView:(UITableView *)tableView
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
   forRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSLog(@"commitEditing section #%d row #%d", indexPath.section, indexPath.row);
   if (editingStyle == UITableViewCellEditingStyleDelete) {
      [tableView beginUpdates];
      
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
      
      NSMutableDictionary * md = [self.data mutableCopy];

   // Delete the task

      NSMutableArray * events = [[md objectForKey:@"events"] mutableCopy];
      NSMutableDictionary * event = [[events objectAtIndex:indexPath.section] mutableCopy];
      NSMutableArray * tasks = [[event objectForKey:@"tasks"] mutableCopy];
      NSDictionary * task = [tasks objectAtIndex:indexPath.row];
      NSString * taskName = [task objectForKey:@"task"];
      NSString * names = [task objectForKey:@"names"];
      [tasks removeObjectAtIndex:indexPath.row];
      [event setObject:tasks forKey:@"tasks"];
      [events replaceObjectAtIndex:indexPath.section withObject:event];
      [md setObject:events forKey:@"events"];

   // Delete the task from users task lists
// TO DO: split names at "," -- or else refresh from server

      NSMutableArray * users = [[md objectForKey:@"users"] mutableCopy];
      NSMutableDictionary * user = nil;
      int ui = 0;
      for (; ui < users.count; ui ++) {
         user = [[users objectAtIndex:ui] mutableCopy];
         if ([[user objectForKey:@"name"] isEqualToString:names]) // currently works only for 1 name
            break;
         user = nil;
NSLog(@"user notfound %@ %@", names, [user objectForKey:@"name"]);
      }
      if (user){
NSLog(@"user found %@ at %d", names, ui);
         NSMutableArray * usertasks = [[user objectForKey:@"tasks"] mutableCopy];
         int uti = 0;
         for (; uti < usertasks.count; uti ++) {
            NSDictionary * usertask = [usertasks objectAtIndex:uti];
            if ([[usertask objectForKey:@"task"] isEqualToString:taskName])
               break;
NSLog(@"usertask notfound %@ %@", taskName, [user objectForKey:@"task"]);
         }
         if (uti < usertasks.count) {
NSLog(@"usertask found %@ at %d", taskName, uti);
            [usertasks removeObjectAtIndex:uti];
            [user setObject:usertasks forKey:@"tasks"];
            [users replaceObjectAtIndex:ui withObject:user];
            [md setObject:users forKey:@"users"];
NSLog(@"%@", md);
         }
      }

   // Done editing

      self.data = md;

      BridesmaidsAppDelegate * ad = (BridesmaidsAppDelegate *)[UIApplication sharedApplication].delegate;
      ad.data = md;

      [tableView endUpdates];
      [tableView reloadData];
   }
   else if (editingStyle == UITableViewCellEditingStyleInsert) {
      EditTaskViewController * etvc = [[EditTaskViewController alloc] init];
      [self.navigationController pushViewController:etvc animated:YES];
   }
}

@end
