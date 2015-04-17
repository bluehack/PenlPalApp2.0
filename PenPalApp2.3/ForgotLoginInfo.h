//
//  ForgotLoginInfo.h
//  PenPalApp2.3
//
//  Created by Computer on 4/13/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import <UIKit/UIKit.h>

extern UITextField *forgotTextField;
extern UILabel *forgotLabel;

@interface ForgotLoginInfo : UIViewController<UIAlertViewDelegate, UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>{
    
}

- (IBAction)cancelButton;
- (IBAction)submitButton;

@property (strong, nonatomic) IBOutlet UITableView  *tableView;

@end
