//
//  DMAViewController.m
//  Digital Magazine
//
//  Created by Austen Johnson on 6/7/14.
//  Copyright (c) 2014 Austen Johnson. All rights reserved.
//

#import "DMAViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "DMATableViewController.h"
#import "DMA4Square.h"
#import "DMAAnnotation.h"

@interface DMAViewController () <CLLocationManagerDelegate>

@end

@implementation DMAViewController
{
    MKMapView *fsMap;
    CLLocationManager *lManager;
    CLLocation *currentLocation;
    DMATableViewController * venuesTVC;
    UILabel *currentPoints;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        lManager = [[CLLocationManager alloc] init];
        lManager.delegate = self;
        [lManager startUpdatingLocation];

    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden = YES;
    
    [super viewDidLoad];
    fsMap = [[MKMapView alloc] initWithFrame:CGRectMake(0, 100, 768, 500)];
    [self.view addSubview:fsMap];
    
    venuesTVC = [[DMATableViewController alloc] init];
    venuesTVC.tableView.frame = CGRectMake(0, 600, 768, [UIScreen mainScreen].bounds.size.height);
    [self.view addSubview:venuesTVC.tableView];
    
    UILabel *vipStatus = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    vipStatus.backgroundColor = [UIColor clearColor];
    vipStatus.text = @"Diamond Member";
    vipStatus.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:vipStatus];
    
    currentPoints = [[UILabel alloc] initWithFrame:CGRectMake(568, 0, 200, 100)];
    currentPoints.backgroundColor = [UIColor clearColor];
    currentPoints.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:currentPoints];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    currentLocation = [locations firstObject];
    
    NSArray *venues = [DMA4Square getVenuesWithLat:currentLocation.coordinate.latitude andLong:currentLocation.coordinate.longitude];
    
    [lManager stopUpdatingLocation];
    
    [self createMapAnnotationWithVenues:venues andLocations:currentLocation.coordinate];
}

- (void)createMapAnnotationWithVenues:(NSArray *)venues andLocations:(CLLocationCoordinate2D)coordinate
{
    
    venuesTVC.venues = venues;

    
    [venuesTVC.tableView reloadData];
    
    double minLat = coordinate.latitude,
    minLong = coordinate.longitude,
    maxLat = coordinate.latitude,
    maxLong = coordinate.longitude;
    
    for (NSDictionary * venue in venues)
    {
    NSDictionary *venueInfo = venue[@"venue"];
    NSDictionary *locationInfo = venueInfo[@"location"];
    
    NSLog(@"%@", locationInfo);
    
    double latitude = [locationInfo[@"lat"]doubleValue];
    double longtiude = [locationInfo[@"lng"]doubleValue];
    
    if (latitude < minLat) minLat = latitude;
    if (latitude > maxLat) maxLat = latitude;
    if (longtiude < minLong) minLong = longtiude;
    if (longtiude > maxLong) maxLong = longtiude;
    
    
    
    DMAAnnotation *annotation = [[DMAAnnotation alloc] init];
    [annotation setCoordinate:CLLocationCoordinate2DMake(latitude, longtiude)];
    
    [fsMap addAnnotation:annotation];
    
    }
    
    double centerLat = (maxLat - minLat) /2.0 + minLat;
    double centerLong = (maxLong - minLong) /2.0 +minLong;
    
    CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(centerLat, centerLong);
    
    MKCoordinateRegion region = MKCoordinateRegionMake(centerCoordinate,
                                                       MKCoordinateSpanMake(maxLat - minLat + (maxLat - minLat) /5, maxLong - minLong + (maxLong - minLong) /5));
    [fsMap setRegion:region animated:YES];
    int num = [venuesTVC.tableView.indexPathsForVisibleRows count];
    NSLog(@"THE MOTHERFUCKING NUMBER OF ROWS %d",num);
    
    int points = [venuesTVC.tableView.indexPathsForVisibleRows count] * 100;
    currentPoints.text = [NSString stringWithFormat:@"%d", points];

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
