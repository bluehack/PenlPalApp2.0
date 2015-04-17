//
//  ForgotLoginInfo.m
//  PenPalApp2.3
//
//  Created by Computer on 4/13/15.
//  Copyright (c) 2015 Computer. All rights reserved.
//

#import "ForgotLoginInfo.h"

UITextField *forgotTextField = nil;
UILabel *forgotLabel = nil;

@interface ForgotLoginInfo ()

@end

@implementation ForgotLoginInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)viewWillAppear:(BOOL)animated{
    float width = 300;
    float height = 38;
    float xPos = 10;
    float yPos = 4;
    
    float labelWidth = 300;
    float labelHeight = 28;
    float buttonX = (self.view.frame.size.width - labelWidth)/2;
    
    forgotTextField = [[UITextField alloc] initWithFrame:CGRectMake(xPos, yPos, width, height)];
    forgotTextField.borderStyle = UITextBorderStyleRoundedRect;
    forgotTextField.textColor = [UIColor blackColor];
    forgotTextField.font = [UIFont systemFontOfSize:17.0];
    forgotTextField.placeholder = @"We will email you a password reset link";
    forgotTextField.backgroundColor = [UIColor clearColor];
    forgotTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    forgotTextField.keyboardType = UIKeyboardTypeDefault;
    forgotTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    forgotTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    forgotTextField.borderStyle = UITextBorderStyleNone;
#pragma mark - may need to center do diff screen sizes
    forgotTextField.tag = 0;
    forgotTextField.delegate = self;
    
    
    
    //[UIColor colorWithRed:30/255.0 green:144/255.0 blue:255/255.0 alpha:1.0]
    
    forgotLabel = [[UILabel alloc] initWithFrame: CGRectMake(buttonX, yPos + 15, labelWidth, labelHeight)];
    
    [forgotLabel setFont:[UIFont fontWithName:@"Helvetica" size:16]];
    [forgotLabel setTextColor:[UIColor blackColor]];
    forgotLabel.textAlignment = NSTextAlignmentCenter;
#pragma mark - translate ; " your email "
    [forgotLabel setText:@"Enter your profile email address"];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 60;
    return tableView.sectionHeaderHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    

    
    
    switch (indexPath.row) {
        case 0:
            [cell addSubview:forgotTextField];
            break;
        default:
            break;
    }

    
#pragma - might make parts a global veriable
    
    [tableView addSubview:forgotLabel];
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}



-(void)tableView:(UITableView *) tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    //[tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
    
    
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
