
#import "UserTasksTableViewController.h"

@interface UserTasksTableViewController ()

@end

@implementation UserTasksTableViewController

@synthesize userIndex = _userIndex;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
   [super viewDidLoad];

   self.tableView.delegate = self;
   self.tableView.dataSource = self;
   
// Uncomment the following line to preserve selection between presentations.
   // self.clearsSelectionOnViewWillAppear = NO;
   
// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   // self.navigationItem.rightBarButtonItem = self.editButtonItem;

}

- (void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];

   NSArray * users = [self.data objectForKey:@"users"];
   NSDictionary * user = [users objectAtIndex:_userIndex];
   self.title = [[NSString alloc] initWithFormat:@"%@'s Tasks", [user objectForKey:@"name"]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
   switch (section) {
      case 0:
      {
         NSArray * users = [self.data objectForKey:@"users"];
         NSDictionary * user = [users objectAtIndex:_userIndex];
         return [user objectForKey:@"name"];
      }
      case 1:
         return @"Unassigned Tasks";
      default:
         return @"???";
   }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   switch (section) {
      case 0:
      {
         NSArray * users = [self.data objectForKey:@"users"];
         NSDictionary * user = [users objectAtIndex:_userIndex];
         NSArray * tasks = [user objectForKey:@"tasks"];
         return tasks.count;
      }
      case 1:
      {
         NSArray * unassigned = [self.data objectForKey:@"unassigned"];
         return unassigned.count;
      }
      default:
         return 0;
   }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
   cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

   NSString * cellIdentifier = @"cell";
/* IMPL: iOS dequeue... method requires registerClass:forCellReuseIdentifier:
   but cell is initialized with hard-coded style UITableViewCellStyleDefault
   UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
*/
   UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   if (! cell) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
   }

   NSArray * users = [self.data objectForKey:@"users"];
   NSDictionary * user = [users objectAtIndex:_userIndex];
   NSArray * tasks = [user objectForKey:@"tasks"];
   NSDictionary * task = [tasks objectAtIndex:indexPath.row];

   cell.textLabel.text = [task objectForKey:@"task"];
   NSString * detailText = [[NSString alloc] initWithFormat:@"for the %@", [task objectForKey:@"event"]];
   cell.detailTextLabel.text = detailText;
   
// TO DO: if wanted, set color (and icon?) from status in database

   cell.imageView.image = indexPath.row % 2
      ? [UIImage imageNamed:@"circular-yellow-glow-transparent.png"]
      : [UIImage imageNamed:@"status-circle-green-check.png"];

   return cell;
}

@end
