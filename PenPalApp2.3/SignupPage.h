//
//  SignupPage.h
//  PenPalApp2.3
//
//  Created by Computer on 4/13/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *gV_signup_age;

@interface SignupPage : UIViewController<UIAlertViewDelegate, UITextFieldDelegate>{
    
}

- (IBAction)cancelButton;
- (IBAction)submitButton;

@end
