//
//  InitView.m
//  PenPalApp2.3
//
//  Created by Computer on 4/12/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "InitView.h"
#import "LoginPage.h"
#import "SignupPage.h"

@interface InitView ()

@end

@implementation InitView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    float buttonY = self.view.frame.size.height * .60;
    float buttonWidth = self.view.frame.size.width - 14; // 300
    float buttonHeight = 45;
    float buttonX = (self.view.frame.size.width - buttonWidth)/2;
    
    //[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight)];
    [loginButton setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
    [loginButton setTitleColor:[UIColor grayColor] forState: UIControlStateHighlighted];
    [loginButton setBackgroundColor:[UIColor whiteColor]];
    
    CALayer *btnLayer = [loginButton layer];
    [btnLayer setMasksToBounds:YES];
    [btnLayer setCornerRadius:3.0f];
    
    [loginButton setTitle:@"Log In" forState:UIControlStateNormal];
    [loginButton setTag:0];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [loginButton addTarget:self action:@selector(logIn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: loginButton];
    
    
    UIButton *signupButton = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, buttonY + 60, buttonWidth, buttonHeight)];
    [signupButton setTitleColor:[UIColor blackColor] forState: UIControlStateNormal];
    [signupButton setTitleColor:[UIColor grayColor] forState: UIControlStateHighlighted];
    [signupButton setBackgroundColor:[UIColor whiteColor]];
    
    CALayer *btnLayer2 = [signupButton layer];
    [btnLayer2 setMasksToBounds:YES];
    [btnLayer2 setCornerRadius:3.0f];
    
    [signupButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [signupButton setTag:1];
    signupButton.titleLabel.font = [UIFont systemFontOfSize:19];
    [signupButton addTarget:self action:@selector(signIn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: signupButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logIn{
    
    LoginPage *loginPage = (LoginPage *) [self.storyboard instantiateViewControllerWithIdentifier:@"loginPage"];
    [self presentViewController:loginPage animated:YES completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)signIn{
    
    SignupPage *signupPage = (SignupPage *) [self.storyboard instantiateViewControllerWithIdentifier:@"signupPage"];
    [self presentViewController:signupPage animated:YES completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
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
