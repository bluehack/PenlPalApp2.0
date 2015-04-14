//
//  LoginPage.m
//  PenPalApp2.3
//
//  Created by Computer on 4/12/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "LoginPage.h"
#import "ForgotLoginInfo.h"

@interface LoginPage ()

@end

@implementation LoginPage

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

-(IBAction) forgotLoginInfo{
    ForgotLoginInfo *forgot = (ForgotLoginInfo *) [self.storyboard instantiateViewControllerWithIdentifier:@"forgot"];
    [self presentViewController:forgot animated:YES completion:nil];
}

- (IBAction)login{
    [self.view endEditing:YES];
    
    // if login info is good
#pragma - remove after testing
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"loggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [[[self presentingViewController] presentingViewController] dismissViewControllerAnimated:NO completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
- (BOOL) textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
