//
//  SignupPage.h
//  PenPalApp2.3
//
//  Created by Computer on 4/13/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *gV_signup_age;

extern UITextField *nameTextField;
extern UITextField *emailTextField;
extern UITextField *passwordTextField;
extern UITextField *usernameTextField;
extern UITextField *birthTextField;
extern UIButton *genderButton;
extern UIButton *countryButton;
extern UIButton *regionButton;

@interface SignupPage : UIViewController<UIAlertViewDelegate, UITextFieldDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>{
    
}

- (IBAction)cancelButton;
- (IBAction)submitButton;

@property (weak, nonatomic) IBOutlet UITableView  *tableView;

@end
