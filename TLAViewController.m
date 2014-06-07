//
//  TLAViewController.m
//  TravelLog
//
//  Created by Ali Houshmand on 6/7/14.
//  Copyright (c) 2014 Ali Houshmand. All rights reserved.
//

#import "TLAViewController.h"
#import "TLALocalCollectionViewController.h"

// will need to #import "DMACollectionVC.h"



@interface TLAViewController ()

@end

@implementation TLAViewController
{
    UILabel * beginDateLabel;
    UIDatePicker * beginDate;
    
    UILabel * endDateLabel;
    UIDatePicker * endDate;
    
    UILabel * welcomeTitle;
    UILabel * socialSources;
    
    UIButton * goToCollection;
    UIButton * launchLocalScrapbook;
    
    UIButton * twitter;
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.view.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
        
        welcomeTitle = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)-150, 40, 300, 50)];
        welcomeTitle.font = [UIFont fontWithName:@"Helvetica" size:40];
        welcomeTitle.text = @"Welcome";
        welcomeTitle.textAlignment = NSTextAlignmentCenter;
        welcomeTitle.textColor = [UIColor colorWithWhite:.75 alpha:.90];
        [self.view addSubview:welcomeTitle];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    socialSources = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH/2)-400, 360, 300, 50)];
    socialSources.font = [UIFont fontWithName:@"Helvetica" size:20];
    socialSources.text = @"Social Media Filters";
    socialSources.textAlignment = NSTextAlignmentCenter;
    socialSources.textColor = [UIColor blueColor];
    [self.view addSubview:socialSources];
    
    
    
    twitter = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-340,400,48,48)];
    [twitter setImage:[UIImage imageNamed:@"sm_twitter_g"] forState:UIControlStateNormal];
    [twitter setImage:[UIImage imageNamed:@"sm_twitter"] forState:UIControlStateSelected];
    [twitter addTarget:self action:@selector(buttonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [twitter setTag:1];
    [self.view addSubview:twitter];
    
    goToCollection = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-340, 600, 680, 80)];
    goToCollection.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    goToCollection.layer.cornerRadius = 20;
    goToCollection.layer.borderColor = [UIColor orangeColor].CGColor;
    goToCollection.layer.borderWidth = 2;
    [goToCollection setTitle:@"Launch Social Scrapbook" forState:UIControlStateNormal];
    [goToCollection addTarget:self action:@selector(goToCollection) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goToCollection];
    
    launchLocalScrapbook = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-340, 480, 680, 80)];
    launchLocalScrapbook.layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    launchLocalScrapbook.layer.cornerRadius = 20;
    launchLocalScrapbook.layer.borderColor = [UIColor orangeColor].CGColor;
    launchLocalScrapbook.layer.borderWidth = 2;
    [launchLocalScrapbook setTitle:@"Launch Scrapbook" forState:UIControlStateNormal];
    [launchLocalScrapbook addTarget:self action:@selector(launchLocalScrapbook) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:launchLocalScrapbook];
    
    
    [self beginDate];
    [self endDate];
    
    
}

-(void)buttonSelected:(UIButton*)sender
{
    
    [sender setSelected:!sender.selected];
    
}


-(void)beginDate
{
    beginDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-340, 100, 100, 20)];
    beginDateLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    beginDateLabel.textColor = [UIColor colorWithWhite:.70 alpha:.90];
    beginDateLabel.textAlignment = NSTextAlignmentLeft;
    beginDateLabel.text = @"Begin Date";
    [self.view addSubview:beginDateLabel];
    

    beginDate = [[UIDatePicker alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-340, 140, 240, 162)];
    [beginDate addTarget:self action:@selector(updateDate:) forControlEvents:UIControlEventValueChanged];
    beginDate.datePickerMode = UIDatePickerModeDate;
    beginDate.backgroundColor = [UIColor clearColor];
    beginDate.layer.borderColor = [UIColor blueColor].CGColor;
    beginDate.layer.borderWidth = 1;
    beginDate.layer.cornerRadius = 10;
    
   // beginDate.transform = CGAffineTransformMakeScale(0.4, 0.4);
    
    [self.view addSubview:beginDate];
    
 }

-(void)endDate
{
    endDateLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2+100, 100, 100, 20)];
    endDateLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    endDateLabel.textAlignment = NSTextAlignmentLeft;
    endDateLabel.textColor = [UIColor colorWithWhite:.70 alpha:.90];
    endDateLabel.text = @"End Date";
    [self.view addSubview:endDateLabel];
    
    
    endDate = [[UIDatePicker alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2+100, 140, 240, 162)];
    [endDate addTarget:self action:@selector(updateDate:) forControlEvents:UIControlEventValueChanged];
    endDate.datePickerMode = UIDatePickerModeDate;
    endDate.backgroundColor = [UIColor clearColor];
    endDate.layer.borderColor = [UIColor blueColor].CGColor;
    endDate.layer.borderWidth = 1;
    endDate.layer.cornerRadius = 10;
    endDate.maximumDate = [NSDate date];
   // endDate.transform = CGAffineTransformMakeScale(0.4, 0.4);
    [self.view addSubview:endDate];
    
}


-(void)updateDate:(id)sender
{
    
    if(sender == endDate)
    {
        NSDate *myEndDate = endDate.date;
    

        // WILL NEED TO LINK SINGLETON PROPERTY ENDDATE
        
        NSLog(@"%@",myEndDate);
    }
    else if(sender == beginDate)
    {
        NSDate *myBeginDate = beginDate.date;
        
        // WILL NEED TO LINK SINGLETON PROPERTY BEGINDATE --> singleton.beginDate = myBeginDate;
        
        NSLog(@"%@",myBeginDate);
    }
    
}

-(void)goToCollection
{
    
//// WILL NEED CODE HERE TO PUSH DATE AND SOCIAL FILTER TO RAILS API
    
    
    
    
/*  WILL NEED TO REMOVE COMMENT, MAKE SURE DMACOLLECTIONVC IMPORTED
 
    DMACollectionVC * collectionVC = [[DMACollectionVC alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    [self.navigationController pushViewController:collectionVC animated:NO];
    
*/
    
    NSLog(@"selected");
    
    
}

-(void)launchLocalScrapbook
{
    
   
    TLALocalCollectionViewController * collectionVC = [[TLALocalCollectionViewController alloc] initWithCollectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    
    UINavigationController * navVC = [[UINavigationController alloc] initWithRootViewController:collectionVC];
    
    [self presentViewController:navVC animated:NO completion:nil];
    
    
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];


}



@end
