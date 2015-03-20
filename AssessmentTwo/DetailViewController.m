//
//  DetailViewController.m
//  AssessmentTwo
//
//  Created by Sherrie Jones on 3/20/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;
@property IBOutlet UITextField *cityNameTextField;
@property IBOutlet UITextField *stateNameTextField;
@property IBOutlet UIImageView *imageView;

@property NSMutableArray *cities;
@property NSMutableArray *images;

@property UISwipeGestureRecognizer *swipeGesture;
@property (strong, nonatomic) NSIndexPath *indexPathToBeDeleted;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cities = [[NSMutableArray alloc] init];

    self.cityName = self.city.cityName;
    self.stateName = self.city.stateName;
    self.cityImage = self.cityImage;

    //City *cityOneImage = [[City alloc] initWithCityName:self.cityName andStateName:self.stateName andCityImage:self.cityImage];
}



- (void)deleteCity {
    self.cityName = nil;
    self.stateName = nil;
    self.cityImage = nil;
}



@end





















