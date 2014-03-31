//
//  MainViewController.m
//  BridesmaidsApp
//
//  Created by Robert Simpson on 3/29/14.
//  Copyright (c) 2014 Bridesmaids App. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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

   self.title = @"Bridesmaids App";

   UIColor * bgColor = [UIColor colorWithRed:0.6 green:0.8 blue:0.7 alpha:1.0];
   self.view.backgroundColor = bgColor;

   UIColor * buttonColor = [UIColor colorWithRed:0.5 green:0.8 blue:0.6 alpha:1.0];
   UIColor * textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
   UIColor * textShadowColor = [UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.5];
   CGSize textShadowOffset = CGSizeMake(1.0f, 1.0f);
   UIColor * borderColor = [UIColor colorWithRed:0.3 green:0.7 blue:0.7 alpha:1.0];

   _button0 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   _button0.tag = 0;
//   [_button0 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button0 setBackgroundColor:buttonColor];
   [_button0 setTitle:@"Bridesmaids App" forState:UIControlStateNormal];
   [_button0 setTitleColor:textColor forState:UIControlStateNormal];
   [_button0 setTitleShadowColor:textShadowColor forState:UIControlStateNormal];
   [_button0.titleLabel setShadowOffset:textShadowOffset];
   [_button0.layer setBorderWidth:2.0f];
   [_button0.layer setBorderColor:borderColor.CGColor];
   [self.view addSubview:_button0];

   _button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   _button1.tag = 1;
   [_button1 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button1 setBackgroundColor:buttonColor];
   [_button1 setTitle:@"To Dos" forState:UIControlStateNormal];
   [_button1 setTitleColor:textColor forState:UIControlStateNormal];
   [_button1 setTitleShadowColor:textShadowColor forState:UIControlStateNormal];
   [_button1.titleLabel setShadowOffset:textShadowOffset];
   [_button1.layer setBorderWidth:2.0f];
   [_button1.layer setBorderColor:borderColor.CGColor];
   [self.view addSubview:_button1];

   _button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   _button2.tag = 2;
   [_button2 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button2 setBackgroundColor:buttonColor];
   [_button2 setTitle:@"Gift Tracking" forState:UIControlStateNormal];
   [_button2 setTitleColor:textColor forState:UIControlStateNormal];
   [_button2 setTitleShadowColor:textShadowColor forState:UIControlStateNormal];
   [_button2.titleLabel setShadowOffset:textShadowOffset];
   [_button2.layer setBorderWidth:2.0f];
   [_button2.layer setBorderColor:borderColor.CGColor];
   [self.view addSubview:_button2];

   _button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   _button3.tag = 3;
   [_button3 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button3 setBackgroundColor:buttonColor];
   [_button3 setTitle:@"Bride Profile" forState:UIControlStateNormal];
   [_button3 setTitleColor:textColor forState:UIControlStateNormal];
   [_button3 setTitleShadowColor:textShadowColor forState:UIControlStateNormal];
   [_button3.titleLabel setShadowOffset:textShadowOffset];
   [_button3.layer setBorderWidth:2.0f];
   [_button3.layer setBorderColor:borderColor.CGColor];
   [self.view addSubview:_button3];

   _button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   _button4.tag = 4;
   [_button4 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button4 setBackgroundColor:buttonColor];
   [_button4 setTitle:@"Vendors" forState:UIControlStateNormal];
   [_button4 setTitleColor:textColor forState:UIControlStateNormal];
   [_button4 setTitleShadowColor:textShadowColor forState:UIControlStateNormal];
   [_button4.titleLabel setShadowOffset:textShadowOffset];
   [_button4.layer setBorderWidth:2.0f];
   [_button4.layer setBorderColor:borderColor.CGColor];
   [self.view addSubview:_button4];

   _button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   _button5.tag = 5;
   [_button5 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button5 setBackgroundColor:buttonColor];
   [_button5 setTitle:@"Messages" forState:UIControlStateNormal];
   [_button5 setTitleColor:textColor forState:UIControlStateNormal];
   [_button5 setTitleShadowColor:textShadowColor forState:UIControlStateNormal];
   [_button5.titleLabel setShadowOffset:textShadowOffset];
   [_button5.layer setBorderWidth:2.0f];
   [_button5.layer setBorderColor:borderColor.CGColor];
   [self.view addSubview:_button5];

   _button6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
   _button6.tag = 6;
   [_button6 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button6 setBackgroundColor:buttonColor];
   [_button6 setTitle:@"Contacts" forState:UIControlStateNormal];
   [_button6 setTitleColor:textColor forState:UIControlStateNormal];
   [_button6 setTitleShadowColor:textShadowColor forState:UIControlStateNormal];
   [_button6.titleLabel setShadowOffset:textShadowOffset];
   [_button6.layer setBorderWidth:2.0f];
   [_button6.layer setBorderColor:borderColor.CGColor];
   [self.view addSubview:_button6];

   [_button1 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button2 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button3 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button4 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button5 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   [_button6 addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
   
}

- (void)button:(id)sender
{
   UIButton * b = sender;
   NSLog(@"button #%d was pressed", b.tag);
// TO DO: should be more specific VC classes based on which button was pressed
   UIViewController * vc = [[UIViewController alloc] init];
   [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewWillLayoutSubviews
{
   
   CGFloat navBarHeight = 65.0f;
   CGFloat tabBarHeight = 50.0f;

   CGFloat w = self.view.bounds.size.width;
   CGFloat h = self.view.bounds.size.height - navBarHeight - tabBarHeight;
   
   CGFloat bw = w / 2.0 - 40.0f;
   CGFloat bh = h / 4.0 - 40.0f;

   CGFloat l1 = 20.0f;
   CGFloat l2 = w / 2.0f + 20.0f;

   CGFloat t0 = navBarHeight + 30.0f;
   CGFloat t1 = navBarHeight + 100.0f;
   CGFloat t2 = navBarHeight + h / 3.0f + 65.0f;
   CGFloat t3 = navBarHeight + h / 3.0f * 2.0f + 30.0f;

   _button0.frame = CGRectMake(l1, t0, bw * 2.0f + 40.0f, bh / 2.0f);
   _button1.frame = CGRectMake(l1, t1, bw, bh);
   _button2.frame = CGRectMake(l2, t1, bw, bh);
   _button3.frame = CGRectMake(l1, t2, bw, bh);
   _button4.frame = CGRectMake(l2, t2, bw, bh);
   _button5.frame = CGRectMake(l1, t3, bw, bh);
   _button6.frame = CGRectMake(l2, t3, bw, bh);

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
