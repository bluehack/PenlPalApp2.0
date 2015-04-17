//
//  MainView.m
//  PenPalApp2.3
//
//  Created by Computer on 4/12/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "MainView.h"
#import "InitView.h"

@import Foundation;

@interface MainView ()

@end

@implementation MainView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    
    // only show if no login data
    NSString* loggedIn_check = [[NSUserDefaults standardUserDefaults] stringForKey:@"loggedIn"];
    
    if (![loggedIn_check isEqualToString:@"YES"]) {
        InitView *initView = (InitView *) [self.storyboard instantiateViewControllerWithIdentifier:@"initView"];
        [self presentViewController:initView animated:NO completion:nil];
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
