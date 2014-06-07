//
//  DMALoginVCViewController.m
//  Digital Magazine
//
//  Created by Austen Johnson on 6/6/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import "DMALoginVC.h"
#import "DMASignUpVC.h"
#import "DMACollectionVC.h"
#import "TLAViewController.h"

@interface DMALoginVC () <UITextFieldDelegate>

@end

@implementation DMALoginVC
{
    UITextField * nameField;
    UITextField * password;
    UIButton * signInButton;
    UIView * loginForm;
    UIAlertView * alert;
    UIButton * signUpButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        loginForm = [[UIView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:loginForm];
        
        nameField = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH /2 - 250), (SCREEN_HEIGHT /2 - 100), 500, 80)];
        nameField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        nameField.placeholder = @" E-Mail";
        nameField.layer.cornerRadius = 6;
        nameField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        nameField.autocorrectionType = UITextAutocorrectionTypeNo;
        nameField.keyboardType = UIKeyboardTypeTwitter;
        [loginForm addSubview:nameField];
        nameField.delegate = self;
        
        password = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_WIDTH /2 - 250), SCREEN_HEIGHT /2, 500, 80)];
        password.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
        password.secureTextEntry = YES;
        password.placeholder = @" password";
        password.layer.cornerRadius = 6;
        password.keyboardType = UIKeyboardTypeTwitter;
        [loginForm addSubview:password];
        password.delegate = self;
        
        signInButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH /2 - 250), (SCREEN_HEIGHT /2) + 100, 500, 80)];
        [signInButton setTitle:@"Sign In" forState:UIControlStateNormal];
        [signInButton addTarget:self action:@selector(signInButton) forControlEvents: UIControlEventTouchUpInside];
        signInButton.backgroundColor = [UIColor blueColor];
        signInButton.layer.cornerRadius = 6;
        signInButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [signInButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [loginForm addSubview:signInButton];
        
        signUpButton = [[UIButton alloc] initWithFrame:CGRectMake((SCREEN_WIDTH /2 - 250), (SCREEN_HEIGHT /2) + 200, 500, 80)];
        [signUpButton setTitle:@"Sign Up" forState:UIControlStateNormal];
        [signUpButton addTarget:self action:@selector(showSignUp) forControlEvents: UIControlEventTouchUpInside];
        signUpButton.backgroundColor = [UIColor lightGrayColor];
        signUpButton.layer.cornerRadius = 6;
        signUpButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        [signUpButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [loginForm addSubview:signUpButton];
    }
    return self;
}

-(void)showSignUp
{
    DMASignUpVC * signUpVC = [[DMASignUpVC alloc] initWithNibName:nil bundle:nil];
    
    UINavigationController *newNav = [[UINavigationController alloc] initWithRootViewController:signUpVC];
    
    [self.navigationController presentViewController:newNav animated:YES completion:^{
    
    }];
}

-(void)tapScreen
{
    [nameField resignFirstResponder];
    [password resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        loginForm.frame = self.view.frame;
    }];
}

-(BOOL)textFieldShouldBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0.2 animations:^{
        loginForm.frame = CGRectMake(0, -KB_HEIGHT /2, 320, self.view.frame.size.height);
    }];
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


-(void)signInButton
{
//    [self hideKeyboard];
    
    UIActivityIndicatorView * activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
    [activity setColor:[UIColor orangeColor]];
    activity.color = [UIColor orangeColor];
    activity.frame = CGRectMake(0, 300, self.view.frame.size.width, 50);
    
    [loginForm addSubview:activity];
    
    [activity startAnimating];
    
    [nameField resignFirstResponder];
    [password resignFirstResponder];
    
    [UIView animateWithDuration:0.2 animations:^{
        loginForm.frame = self.view.frame;
    }];
    TLAViewController *viewController = [[TLAViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
