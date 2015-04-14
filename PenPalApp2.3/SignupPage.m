//
//  SignupPage.m
//  PenPalApp2.3
//
//  Created by Computer on 4/13/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "SignupPage.h"
#import "SignupOptions.h"

@interface SignupPage ()

@end

@implementation SignupPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIScrollView* scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0 + 72, self.view.bounds.size.width, self.view.bounds.size.height)];
    scrollView.scrollEnabled = YES;
    scrollView.pagingEnabled = NO;
    scrollView.showsVerticalScrollIndicator = YES;
    scrollView.showsHorizontalScrollIndicator = YES;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height + 200);
    [self.view insertSubview:scrollView atIndex:0];
    
    float width = 300;
    float height = 38;
    float xPos = 10;
    float yPos = 20;
    
    float buttonWidth = 300;
    float buttonHeight = 28;
    float buttonX = (self.view.frame.size.width - buttonWidth)/2;
    
    UITextField *nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    nameTextField.textColor = [UIColor blackColor];
    nameTextField.font = [UIFont systemFontOfSize:17.0];
    nameTextField.placeholder = @"Name";
    nameTextField.backgroundColor = [UIColor clearColor];
    nameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    nameTextField.keyboardType = UIKeyboardTypeDefault;
    nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
#pragma mark - may need to center do diff screen sizes
    nameTextField.tag = 0;
    nameTextField.delegate = self;
    [scrollView addSubview:nameTextField];
    
    UITextField *emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos + 50, width, height)];
    emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    emailTextField.textColor = [UIColor blackColor];
    emailTextField.font = [UIFont systemFontOfSize:17.0];
    emailTextField.placeholder = @"Email Address";
    emailTextField.backgroundColor = [UIColor clearColor];
    emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    emailTextField.autocapitalizationType = false;
    emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    emailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    emailTextField.tag = 1;
    emailTextField.delegate = self;
    [scrollView addSubview:emailTextField];
    
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos + 100, width, height)];
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.textColor = [UIColor blackColor];
    passwordTextField.font = [UIFont systemFontOfSize:17.0];
    passwordTextField.placeholder = @"Password";
    passwordTextField.backgroundColor = [UIColor clearColor];
    passwordTextField.keyboardType = UIKeyboardTypeDefault;
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTextField.secureTextEntry = true;
    passwordTextField.tag = 2;
    passwordTextField.delegate = self;
    [scrollView addSubview:passwordTextField];
    
    UITextField *usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos + 150, width, height)];
    usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    usernameTextField.textColor = [UIColor blackColor];
    usernameTextField.font = [UIFont systemFontOfSize:17.0];
    usernameTextField.placeholder = @"Username";
    usernameTextField.backgroundColor = [UIColor clearColor];
    usernameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    usernameTextField.autocapitalizationType = false;
    usernameTextField.keyboardType = UIKeyboardTypeDefault;
    usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    usernameTextField.tag = 3;
    usernameTextField.delegate = self;
    [scrollView addSubview:usernameTextField];

    UITextField *birthTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos + 200, width, height)];
    birthTextField.borderStyle = UITextBorderStyleRoundedRect;
    birthTextField.textColor = [UIColor blackColor];
    birthTextField.font = [UIFont systemFontOfSize:17.0];
    birthTextField.placeholder = @"Birthdate MM-DD-YYYY";
#pragma mark - may need to auto add / and pad 0's for 1-9.
    birthTextField.backgroundColor = [UIColor clearColor];
    birthTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    birthTextField.keyboardType = UIKeyboardTypeNumberPad;
    birthTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    birthTextField.tag = 4;
    birthTextField.delegate = self;
    [scrollView addSubview:birthTextField];
    
    UIButton *genderButton = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, yPos + 270, buttonWidth, buttonHeight)];
    [genderButton setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    [genderButton setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [genderButton setTitle:@"Select Gender" forState:UIControlStateNormal];
    [genderButton setTag:5];
    [genderButton addTarget:self action:@selector(actionBTN:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview: genderButton];
    
    UIButton *countryButton = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, yPos + 320, buttonWidth, buttonHeight)];
    [countryButton setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    [countryButton setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [countryButton setTitle:@"Select Country" forState:UIControlStateNormal];
    [countryButton setTag:6];
    [countryButton addTarget:self action:@selector(actionBTN:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview: countryButton];
    
    UIButton *regionButton = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, yPos + 370, buttonWidth, buttonHeight)];
    [regionButton setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    [regionButton setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [regionButton setTitle:@"Select Region" forState:UIControlStateNormal];
    [regionButton setTag:7];
    [regionButton addTarget:self action:@selector(actionBTN:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview: regionButton];
    
    UIButton *cityButton = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, yPos + 420, buttonWidth, buttonHeight)];
    [cityButton setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    [cityButton setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [cityButton setTitle:@"Select City" forState:UIControlStateNormal];
    [cityButton setTag:8];
    [cityButton addTarget:self action:@selector(actionBTN:) forControlEvents:UIControlEventTouchUpInside];
#pragma - removed during initial launch
    //[scrollView addSubview: cityButton];

}

-(void)viewWillAppear:(BOOL)animated{
    
    // set button with user data
    UIButton* gndr = (UIButton *)[self.view viewWithTag:5];
    NSString* Gender_text = [[NSUserDefaults standardUserDefaults] stringForKey:@"Gender_text"];
    if (![Gender_text length] == 0) {[gndr setTitle:Gender_text forState:UIControlStateNormal];}
    
    UIButton* cntry = (UIButton *)[self.view viewWithTag:6];
    NSString* Country_text = [[NSUserDefaults standardUserDefaults] stringForKey:@"Country_text"];
    if (![Country_text length] == 0) {[cntry setTitle:Country_text forState:UIControlStateNormal];}

    UIButton* rgn = (UIButton *)[self.view viewWithTag:7];
    NSString* Region_text = [[NSUserDefaults standardUserDefaults] stringForKey:@"Region_text"];
    if (![Region_text length] == 0) {[rgn setTitle:Region_text forState:UIControlStateNormal];}
    else{
        [rgn setTitle:@"Select Region" forState:UIControlStateNormal];
    }
    
    UIButton* cty = (UIButton *)[self.view viewWithTag:8];
    NSString* City_text = [[NSUserDefaults standardUserDefaults] stringForKey:@"City_text"];
    if (![City_text length] == 0) {[cty setTitle:City_text forState:UIControlStateNormal];}
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)submitButton{
    
    // check that info is correct, show error msg if not
    UIAlertView *error = [[UIAlertView alloc]
                              initWithTitle: @"Potential Error msg"
                              message: nil
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [error show];
    
    // if data is good, proceed. Store user info as ints for fast upload & security
    NSInteger Gender = [[NSUserDefaults standardUserDefaults] integerForKey:@"Gender"];
    NSInteger Country = [[NSUserDefaults standardUserDefaults] integerForKey:@"Country"];
    NSInteger Region = [[NSUserDefaults standardUserDefaults] integerForKey:@"Region"];
    NSInteger City = [[NSUserDefaults standardUserDefaults] integerForKey:@"City"];
    
#pragma - remove after testing
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"loggedIn"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.view endEditing:YES];
    [[[self presentingViewController] presentingViewController] dismissViewControllerAnimated:NO completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)actionBTN:(id)sender{
    
    //NSLog(@"Sender: %ld", (long)[sender tag]);
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInteger:[sender tag]] forKey:@"pageListID"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    SignupOptions *signupOptions = (SignupOptions *) [self.storyboard instantiateViewControllerWithIdentifier:@"signupOptions"];
    [self presentViewController:signupOptions animated:YES completion:nil];
}



NSMutableString *filteredPhoneStringFromStringWithFilter(NSString *string, NSString *filter)
{
    NSUInteger onOriginal = 0, onFilter = 0, onOutput = 0;
    char outputString[([filter length])];
    BOOL done = NO;
    
    while(onFilter < [filter length] && !done)
    {
        char filterChar = [filter characterAtIndex:onFilter];
        char originalChar = onOriginal >= string.length ? '\0' : [string characterAtIndex:onOriginal];
        switch (filterChar) {
            case '#':
                if(originalChar=='\0')
                {
                    // We have no more input numbers for the filter.  We're done.
                    done = YES;
                    break;
                }
                if(isdigit(originalChar))
                {
                    outputString[onOutput] = originalChar;
                    onOriginal++;
                    onFilter++;
                    onOutput++;
                }
                else
                {
                    onOriginal++;
                }
                break;
            default:
                // Any other character will automatically be inserted for the user as they type (spaces, - etc..) or deleted as they delete if there are more numbers to come.
                outputString[onOutput] = filterChar;
                onOutput++;
                onFilter++;
                if(originalChar == filterChar)
                    onOriginal++;
                break;
        }
    }
    outputString[onOutput] = '\0'; // Cap the output string
    return [NSMutableString stringWithUTF8String:outputString];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *filter = nil;
    
    switch(textField.tag) {
        case 4:
        {
            filter = @"##-##-####";
        }
        default:
            break;
    }
            
    if(!filter) return YES; // No filter provided, allow anything
    
    NSString *changedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if(range.length == 1 && // Only do for single deletes
       string.length < range.length &&
       [[textField.text substringWithRange:range] rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]].location == NSNotFound)
    {
        // Something was deleted.  Delete past the previous number
        NSInteger location = changedString.length-1;
        if(location > 0)
        {
            for(; location > 0; location--)
            {
                if(isdigit([changedString characterAtIndex:location]))
                {
                    break;
                }
            }
            changedString = [changedString substringToIndex:location];
        }
    }
    
    textField.text = filteredPhoneStringFromStringWithFilter(changedString, filter);
    
    return NO;
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
