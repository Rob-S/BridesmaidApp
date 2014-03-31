
#import <UIKit/UIKit.h>

@interface BridesmaidsAppDelegate : UIResponder <UIApplicationDelegate, UINavigationControllerDelegate>
{

@private

   UIWindow * _window;
   UITabBarController * _tabBarController;

   BOOL needData;
   NSMutableData * _responseData;
   NSDictionary * _data;

}

@property (strong, nonatomic) UIWindow * window;

@property (nonatomic, retain) NSDictionary * data;

@end
