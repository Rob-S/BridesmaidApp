
#import "BridesmaidsAppDelegate.h"

#import "MaidsTableViewController.h"
#import "MainViewController.h"
#import "TasksTableViewController.h"

@implementation BridesmaidsAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application
   didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

   _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
   _window.backgroundColor = [UIColor whiteColor];

   _tabBarController = [[UITabBarController alloc] init];
   _tabBarController.tabBar.barTintColor = [UIColor blackColor];

   UIColor * navBarColor = [UIColor colorWithRed:0.6745 green:0.898 blue:0.7412 alpha:1.0];
   [[UINavigationBar appearance] setBarTintColor:navBarColor];

   UINavigationController * nc1 = [[UINavigationController alloc] init];
   MainViewController * vc1 = [[MainViewController alloc] init];
   nc1 = [[UINavigationController alloc] initWithRootViewController:vc1];
   nc1.tabBarItem.title = @"Main";
   nc1.delegate = self;

   UINavigationController * nc2 = [[UINavigationController alloc] init];
   MaidsTableViewController * vc2 = [[MaidsTableViewController alloc] init];
   nc2 = [[UINavigationController alloc] initWithRootViewController:vc2];
   nc2.tabBarItem.title = @"Maids";
   nc2.delegate = self;

   UINavigationController * nc3 = [[UINavigationController alloc] init];
   TasksTableViewController * vc3 = [[TasksTableViewController alloc] init];
   nc3 = [[UINavigationController alloc] initWithRootViewController:vc3];
   nc3.tabBarItem.title = @"Tasks";
   nc3.delegate = self;

   NSArray * vcs = [[NSArray alloc] initWithObjects:nc1, nc2, nc3, nil];
   _tabBarController.viewControllers = vcs;

   [_window setRootViewController:_tabBarController];
   
   [_window makeKeyAndVisible];

   needData = YES;
   
   return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
   // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
   // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
   // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
   // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (NSDictionary *)data
{

// TO DO: if _data is null but needData = NO then request may be in progress

   if (needData) {
      needData = NO;
      NSURLRequest * req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://api2.com/bridesmaidsapp.php?e=1"]];
      NSURLConnection * conn = [[NSURLConnection alloc] initWithRequest:req delegate:self];
NSLog(@"%@", conn);
   }

   return _data;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
   NSLog(@"didReceiveResponse");
   _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
   NSLog(@"didReceiveData");
   [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
   willCacheResponse:(NSCachedURLResponse*)cachedResponse
{
   NSLog(@"willCacheResponse");
   return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {

//   _data = [[NSString alloc] initWithData:_responseData encoding:NSUTF8StringEncoding];
   NSError * error = [[NSError alloc] init];
   _data = [NSJSONSerialization JSONObjectWithData:_responseData options:0x00 error: &error];
   NSLog(@"connectionDidFinishLoading %@", _data);

// Reload data if current tab uses a table view

   UINavigationController * nc = (UINavigationController *)[_tabBarController.viewControllers objectAtIndex:_tabBarController.selectedIndex];
   if ([nc.topViewController isKindOfClass:BaseTableViewController.class]) {
      BridesmaidsAppDelegate * ad = (BridesmaidsAppDelegate *)[UIApplication sharedApplication].delegate;
      BaseTableViewController * btvc = (BaseTableViewController *)nc.topViewController;
      btvc.data = ad.data;
      [btvc.tableView reloadData];
   }

}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
   NSLog(@"didFailWithError");
}

@end
