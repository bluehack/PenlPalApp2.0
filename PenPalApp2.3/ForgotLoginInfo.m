//
//  ForgotLoginInfo.m
//  PenPalApp2.3
//
//  Created by Computer on 4/13/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "ForgotLoginInfo.h"

@interface ForgotLoginInfo ()

@end

@implementation ForgotLoginInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)submitButton{
    
    // alert if error
    
    //if good
    UIAlertView *resetSent = [[UIAlertView alloc]
                          initWithTitle: @"Please check your email for your password reset link"
                          message: nil
                          delegate: nil
                          cancelButtonTitle:@"Done"
                          otherButtonTitles:nil];
    [resetSent show];
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
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
