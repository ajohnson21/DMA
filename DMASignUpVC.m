//
//  DMASignUpVC.m
//  Digital Magazine
//
//  Created by Austen Johnson on 6/6/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import "DMASignUpVC.h"

@interface DMASignUpVC () <UITextFieldDelegate>

@end

@implementation DMASignUpVC
{
    UIView * signUpForm;
    NSArray * fieldNames;
    NSMutableArray * fields;
    
    float signupOrigY;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor = [UIColor whiteColor];
        self.navigationController.navigationBarHidden = NO;

    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    UIBarButtonItem * cancelSignUpButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelSignup)];
    
    cancelSignUpButton.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = cancelSignUpButton;
    
    signupOrigY = (self.view.frame.size.height - 240) /2;
    signUpForm = [[UIView alloc] initWithFrame:CGRectMake(20, signupOrigY, 280, 240)];
    
    [self.view addSubview:signUpForm];
    
    
    fieldNames = @[
                   @"Email",
                   @"Password",
                   ];
    
    fields = [@[] mutableCopy];
    
    for (NSString * name in fieldNames)
    {
        NSInteger index = [fieldNames indexOfObject:name];
        
        UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH /2) - 250, index * 100, 500, 80)];
        textField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        textField.layer.cornerRadius = 6;
        textField.placeholder = name;
        textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.delegate = self;
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        
        [fields addObject:textField];
        [signUpForm addSubview:textField];
        
        
        
    }
    
    UIButton * submitButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH /2) - 250, (SCREEN_HEIGHT /2) - 310, 500, 80)];
    [submitButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(signUp) forControlEvents: UIControlEventTouchUpInside];
    submitButton.backgroundColor = [UIColor greenColor];
    submitButton.layer.cornerRadius = 6;
    [signUpForm addSubview:submitButton];
    
}

-(void)signUp
{
    
}

-(void)cancelSignup
{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    int extraSlide = 0;
    
    if(self.view.frame.size.height > 500)
    {
        extraSlide = 107;
    } else
    {
        NSInteger index = [fields indexOfObject:textField];
        
        extraSlide = index * 25 + 65;
    }
    
    
    [UIView animateWithDuration:0.3 animations:^{
        signUpForm.frame = CGRectMake(20, signupOrigY - extraSlide, 280, 240);
        
        
    }];
}

-(void)hideKeyBoard
{
    for (UITextField * textFieldItem in fields) {
        [textFieldItem resignFirstResponder];
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        signUpForm.frame = CGRectMake(20, signupOrigY, 280, 240);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
