
#import "BaseTableViewController.h"
#import "BridesmaidsAppDelegate.h"

@interface BaseTableViewController ()

@end

@implementation BaseTableViewController

@synthesize data = _data;

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

   UIColor * bgColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
   self.view.backgroundColor = bgColor;

/* IMPL: iOS dequeue... method requires registerClass:forCellReuseIdentifier:
   but cell is initialized with hard-coded style UITableViewCellStyleDefault
   [self.tableView registerClass:UITableViewCell.class forCellReuseIdentifier:@"cell"];
*/

   BridesmaidsAppDelegate * ad = (BridesmaidsAppDelegate *)[UIApplication sharedApplication].delegate;
   _data = ad.data;

}

- (void)viewWillAppear:(BOOL)animated
{
   [super viewWillAppear:animated];

   BridesmaidsAppDelegate * ad = (BridesmaidsAppDelegate *)[UIApplication sharedApplication].delegate;
   _data = ad.data;

   [self.tableView reloadData];

}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
   [super setEditing:editing animated:animated];
   [self.tableView setEditing:editing animated:animated];
}

#pragma mark - Table view data source

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
   return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
   NSLog(@"commitEditingStyle");
   if (editingStyle == UITableViewCellEditingStyleDelete) {
      [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
   }
   else if (editingStyle == UITableViewCellEditingStyleInsert) {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
   NSLog(@"moveRowAtIndexPath");
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

@end
