//
//  LKViewController.m
//  LKAppView
//
//  Created by Hiroshi Hashiguchi on 2014/02/13.
//  Copyright (c) 2014年 lakesoft. All rights reserved.
//

#import "LKViewController.h"
#import "LKAppView.h"
@interface LKViewController ()
@property (weak, nonatomic) IBOutlet LKAppView *appView;

@end

@implementation LKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.appView.textColor = UIColor.whiteColor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
