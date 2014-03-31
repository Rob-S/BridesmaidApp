
#import "MaidsTableViewController.h"
#import "UserTasksTableViewController.h"

@interface MaidsTableViewController ()

@end

@implementation MaidsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
   [super viewDidLoad];

   self.title = @"Bridesmaids";
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   NSArray * users = [self.data objectForKey:@"users"];
   return users.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
   cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
   NSArray * users = [self.data objectForKey:@"users"];

   NSString * cellIdentifier = @"cell";
/* IMPL: iOS dequeue... method requires registerClass:forCellReuseIdentifier:
    but cell is initialized with hard-coded style UITableViewCellStyleDefault
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
*/
   UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   if (! cell) {
      cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
   }

   NSDictionary * user = [users objectAtIndex:indexPath.row];
   cell.textLabel.text = [user objectForKey:@"name"];
   cell.detailTextLabel.text = [user objectForKey:@"role"];

   return cell;
}

- (void)tableView:(UITableView *)tableView
   didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   UserTasksTableViewController * utvc = [[UserTasksTableViewController alloc] init];
   utvc.userIndex = indexPath.row;
   [self.navigationController pushViewController:utvc animated:YES];
}

@end
