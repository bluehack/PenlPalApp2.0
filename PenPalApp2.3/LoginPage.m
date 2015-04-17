//
//  LoginPage.m
//  PenPalApp2.3
//
//  Created by Computer on 4/12/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "LoginPage.h"
#import "ForgotLoginInfo.h"

UITextField *loginNameTextField = nil;
UITextField *loginPasswordTextField = nil;
UIButton *forgotButton = nil;

@interface LoginPage ()

@end

@implementation LoginPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    float width = 300;
    float height = 38;
    float xPos = 14;
    float yPos = 4;
    
    float buttonWidth = 300;
    float buttonHeight = 28;
    float buttonX = (self.view.frame.size.width - buttonWidth)/2;
    
    loginNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    loginNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    loginNameTextField.textColor = [UIColor blackColor];
    loginNameTextField.font = [UIFont systemFontOfSize:17.0];
    loginNameTextField.placeholder = @"Username";
    loginNameTextField.backgroundColor = [UIColor clearColor];
    loginNameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    loginNameTextField.keyboardType = UIKeyboardTypeDefault;
    loginNameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    loginNameTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    loginNameTextField.borderStyle = UITextBorderStyleNone;
#pragma mark - may need to center do diff screen sizes
    loginNameTextField.tag = 0;
    loginNameTextField.delegate = self;
    
    loginPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    loginPasswordTextField.borderStyle = UITextBorderStyleRoundedRect;
    loginPasswordTextField.textColor = [UIColor blackColor];
    loginPasswordTextField.font = [UIFont systemFontOfSize:17.0];
    loginPasswordTextField.placeholder = @"Password";
    loginPasswordTextField.backgroundColor = [UIColor clearColor];
    loginPasswordTextField.keyboardType = UIKeyboardTypeDefault;
    loginPasswordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    loginPasswordTextField.borderStyle = UITextBorderStyleNone;
    loginPasswordTextField.secureTextEntry = true;
    loginPasswordTextField.tag = 1;
    loginPasswordTextField.delegate = self;
    
    
    forgotButton = [[UIButton alloc] initWithFrame: CGRectMake(buttonX, yPos + 160, buttonWidth, buttonHeight)];
    [forgotButton setTitleColor:[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0] forState: UIControlStateNormal];
    forgotButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [forgotButton setTitleColor:[UIColor blueColor] forState: UIControlStateHighlighted];
    [forgotButton setTitle:@"Forgot Password Information?" forState:UIControlStateNormal];
    [forgotButton setTag:3];
    [forgotButton addTarget:self action:@selector(forgotLoginInfo) forControlEvents:UIControlEventTouchUpInside];
    

    
}

-(void)viewWillAppear:(BOOL)animated{
    
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
    
    // post data to db
    loginNameTextField.text = loginNameTextField.text;
    loginPasswordTextField.text = loginPasswordTextField.text;
    
    [[[self presentingViewController] presentingViewController] dismissViewControllerAnimated:NO completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    // Return the number of rows in the section.

    return 2;
    
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    switch (indexPath.row) {
        case 0:
            [cell addSubview:loginNameTextField];
            break;
        case 1:
            [cell addSubview:loginPasswordTextField];
            break;
        default:
            break;
    }

    
    //self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 40)];
    //[self.tableView.tableFooterView setBackgroundColor: [UIColor blackColor]];
   
    
    
#pragma - might make parts a global veriable
 
    [tableView addSubview:forgotButton];

    
    //cell.textLabel.text = [parts objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}



-(void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
  
    
    
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
