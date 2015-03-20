//
//  RootViewController.m
//  AssessmentTwo
//
//  Created by Sherrie Jones on 3/20/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "RootViewController.h"
#import "City.h"
#import "DetailViewController.h"
#import <UIKit/UIKit.h>

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic)  IBOutlet UITableView *tableView;
@property NSMutableArray *cities;
@property UISwipeGestureRecognizer *swipeGesture;
@property (strong, nonatomic) NSIndexPath *indexPathToBeDeleted;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadInitialValues];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;
}

#pragma mark - Helper methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CityCell"];
    City *newCity = [self.cities objectAtIndex:indexPath.row]; // creates a city w/custom initializer

    cell.textLabel.text = [[self.cities objectAtIndex:indexPath.row] cityName];
    cell.detailTextLabel.text = newCity.stateName;
    cell.detailTextLabel.text = [[self.cities objectAtIndex:indexPath.row] cityImage];
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:self.cities withRowAnimation:UITableViewRowAnimationTop];
    }
    [tableView reloadData];
}


- (void)loadInitialValues {
    City *cityOne = [[City alloc] initWithCityName:@"Denver"
                                        andStateName:@"Colorado"
                                        andCityImage:@"Denver.png"];

    City *cityTwo = [[City alloc] initWithCityName:@"Seattle"
                                        andStateName:@"Washington"
                                        andCityImage:@"Seattle.png"];

    City *cityThree = [[City alloc] initWithCityName:@"Houston"
                                        andStateName:@"Texas"
                                        andCityImage:@"Houston.png"];

    City *cityFour = [[City alloc] initWithCityName:@"SanDiego"
                                        andStateName:@"California"
                                        andCityImage:@"sanDiego.png"];

    self.cities = [NSMutableArray arrayWithObjects:cityOne,cityTwo,cityThree, cityFour, nil];
//    for (City *city in self.cities) {
//        NSLog(@"city: %@ state: %@ pix: %@", city.cityName, city.stateName, city.cityImage);
//    }


}

#pragma mark - UISegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    City *newCity = [self.cities objectAtIndex:indexPath.row];

    DetailViewController *detail = segue.destinationViewController;

    detail.cityName = newCity.cityName;
    detail.stateName = newCity.stateName;
    detail.cityImage = newCity.cityImage;
}

@end




























