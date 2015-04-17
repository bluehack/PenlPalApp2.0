//
//  LoginPage.h
//  PenPalApp2.3
//
//  Created by Computer on 4/12/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import <UIKit/UIKit.h>

extern UITextField *loginNameTextField;
extern UITextField *loginPasswordTextField;
extern UIButton *forgotButton;

@interface LoginPage : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource> {
    
}

-(IBAction) cancelButton;
-(IBAction) forgotLoginInfo;
-(IBAction) login;


@property (strong, nonatomic) IBOutlet UITableView  *tableView;

@end
