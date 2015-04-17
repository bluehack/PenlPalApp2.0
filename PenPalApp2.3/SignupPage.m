//
//  SignupPage.m
//  PenPalApp2.3
//
//  Created by Computer on 4/13/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "SignupPage.h"
#import "SignupOptions.h"

NSString *gV_signup_age = @"";

UITextField *nameTextField = nil;
UITextField *emailTextField = nil;
UITextField *passwordTextField = nil;
UITextField *usernameTextField = nil;
UITextField *birthTextField = nil;
UIButton *genderButton = nil;
UIButton *countryButton = nil;
UIButton *regionButton = nil;

@interface SignupPage ()

@end

@implementation SignupPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    

}

-(void)viewWillAppear:(BOOL)animated{
    
    
    float width = 300;
    float height = 38;
    float xPos = 15;
    float yPos = 3;
    
    float buttonWidth = 300;
    float buttonHeight = 28;
    float buttonX = (self.view.frame.size.width - buttonWidth)/2;
    
    nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    nameTextField.borderStyle = UITextBorderStyleRoundedRect;
    nameTextField.textColor = [UIColor blackColor];
    nameTextField.font = [UIFont systemFontOfSize:17.0];
    nameTextField.placeholder = @"Name";
    nameTextField.backgroundColor = [UIColor clearColor];
    nameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    nameTextField.keyboardType = UIKeyboardTypeDefault;
    nameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
#pragma mark - may need to center do diff screen sizes
    nameTextField.borderStyle = UITextBorderStyleNone;
    nameTextField.tag = 0;
    nameTextField.delegate = self;
    
    
    emailTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    emailTextField.textColor = [UIColor blackColor];
    emailTextField.font = [UIFont systemFontOfSize:17.0];
    emailTextField.placeholder = @"Email Address";
    emailTextField.backgroundColor = [UIColor clearColor];
    emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    emailTextField.autocapitalizationType = false;
    emailTextField.keyboardType = UIKeyboardTypeEmailAddress;
    emailTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    emailTextField.borderStyle = UITextBorderStyleNone;
    emailTextField.tag = 1;
    emailTextField.delegate = self;
    
    
    passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.textColor = [UIColor blackColor];
    passwordTextField.font = [UIFont systemFontOfSize:17.0];
    passwordTextField.placeholder = @"Password";
    passwordTextField.backgroundColor = [UIColor clearColor];
    passwordTextField.keyboardType = UIKeyboardTypeDefault;
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTextField.secureTextEntry = true;
    passwordTextField.tag = 2;
    passwordTextField.borderStyle = UITextBorderStyleNone;
    passwordTextField.delegate = self;
    
    
    usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
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
    usernameTextField.borderStyle = UITextBorderStyleNone;
    usernameTextField.delegate = self;
    
    
    birthTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    birthTextField.borderStyle = UITextBorderStyleRoundedRect;
    birthTextField.textColor = [UIColor blackColor];
    birthTextField.font = [UIFont systemFontOfSize:17.0];
    birthTextField.placeholder = NSLocalizedString(@"Birthday 01-31-1999", nil);
#pragma mark - may need to auto add / and pad 0's for 1-9.
    birthTextField.backgroundColor = [UIColor clearColor];
    birthTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    birthTextField.keyboardType = UIKeyboardTypeNumberPad;
    birthTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    birthTextField.borderStyle = UITextBorderStyleNone;
    birthTextField.tag = 4;
    birthTextField.delegate = self;
    
    
    genderButton = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, yPos + 5, buttonWidth, buttonHeight)];
    [genderButton setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    [genderButton setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [genderButton setTitle:@"Select Gender" forState:UIControlStateNormal];
    [genderButton setTag:5];
    [genderButton addTarget:self action:@selector(actionBTN:) forControlEvents:UIControlEventTouchUpInside];
    
    
    countryButton = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, yPos + 5, buttonWidth, buttonHeight)];
    [countryButton setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    [countryButton setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [countryButton setTitle:@"Select Country" forState:UIControlStateNormal];
    [countryButton setTag:6];
    [countryButton addTarget:self action:@selector(actionBTN:) forControlEvents:UIControlEventTouchUpInside];
    
    
    regionButton = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, yPos + 5, buttonWidth, buttonHeight)];
    [regionButton setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    [regionButton setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [regionButton setTitle:@"Select Region" forState:UIControlStateNormal];
    [regionButton setTag:7];
    [regionButton addTarget:self action:@selector(actionBTN:) forControlEvents:UIControlEventTouchUpInside];
    

    
    // set button with user data
    NSString* Gender_text = [[NSUserDefaults standardUserDefaults] stringForKey:@"Gender_text"];
    if (![Gender_text length] == 0) {[genderButton setTitle:Gender_text forState:UIControlStateNormal];}
    
    NSString* Country_text = [[NSUserDefaults standardUserDefaults] stringForKey:@"Country_text"];
    if (![Country_text length] == 0) {[countryButton setTitle:Country_text forState:UIControlStateNormal];}

    NSString* Region_text = [[NSUserDefaults standardUserDefaults] stringForKey:@"Region_text"];
    if (![Region_text length] == 0) {[regionButton setTitle:Region_text forState:UIControlStateNormal];}
    else{[regionButton setTitle:@"Select Region" forState:UIControlStateNormal];}
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButton{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    switch (section) {
        case 0:
            return 3;
            break;
        case 4:
            return 2;
            break;
        default:
            break;
    }
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 20;
    if (section == 4)
        return 40;
    return tableView.sectionHeaderHeight;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 4)
        return 250;
    return tableView.sectionFooterHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    
    if (indexPath.section == 0) {
    switch (indexPath.row) {
        case 0:
            [cell addSubview:usernameTextField];
            break;
        case 1:
            [cell addSubview:nameTextField];
            break;
        case 2:
            [cell addSubview:passwordTextField];
            break;
        default:
            break;
        }
    }
    if (indexPath.section == 1) {
        switch (indexPath.row) {
            case 0:
                [cell addSubview:emailTextField];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 2) {
        switch (indexPath.row) {
            case 0:
                [cell addSubview:birthTextField];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 3) {
        switch (indexPath.row) {
            case 0:
                [cell addSubview: genderButton];
                break;
            default:
                break;
        }
    }
    if (indexPath.section == 4) {
        switch (indexPath.row) {
        case 0:
            [cell addSubview: countryButton];
            break;
        case 1:
            [cell addSubview: regionButton];
            break;
        default:
            break;
        
        }
       
    }

#pragma - might make parts a global veriable

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}



-(void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

- (IBAction)submitButton{
    
    // check that info is correct, show error msg if not
    
    NSString *dateFromTextfield = gV_signup_age;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM-dd-yyyy"];
    NSDate *date = [dateFormat dateFromString:dateFromTextfield];
    // check if date is null
    NSLog(@"%@", date);
    NSDate* birthday = date;
    
NSDate* now = [NSDate date];
NSDateComponents* ageComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:birthday toDate:now options:0];
    
    // check that user age is in exeptable range
    NSInteger age = [ageComponents year];
    NSLog(@"Age: %ld", (long)age);
    
    UIAlertView *error = [[UIAlertView alloc]
                              initWithTitle: @"Potential Error msg"
                              message: nil
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
    [error show];
    
    // if data is good, proceed. Store user info as ints for fast upload & security
    NSString *Gender = [[NSUserDefaults standardUserDefaults] stringForKey:@"Gender"];
    NSString *Country = [[NSUserDefaults standardUserDefaults] stringForKey:@"Country"];
    // will add a 1 to everyone if the region list gets updated
    NSString *Region = [[NSUserDefaults standardUserDefaults] stringForKey:@"Region"];
    
    NSLog(@"Sex: %@, Age: %@, Cny: %@, Reg: %@", Gender, gV_signup_age, Country, Region);
    
#pragma - remove after testing
    //[[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"loggedIn"];
    //[[NSUserDefaults standardUserDefaults] synchronize];
    
    //[self.view endEditing:YES];
    //[[[self presentingViewController] presentingViewController] dismissViewControllerAnimated:NO completion:nil];
    //[self dismissViewControllerAnimated:YES completion:nil];
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
    gV_signup_age = textField.text;
     //NSLog(@"txt: %@", textField.text);
    
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
