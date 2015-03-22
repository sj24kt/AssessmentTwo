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

@interface RootViewController () <UITableViewDataSource, UITableViewDelegate, DetailViewControllerDelegate>

@property (strong, nonatomic)  IBOutlet UITableView *tableView;
@property NSMutableArray *cities;

@end

@implementation RootViewController

#pragma mark - ViewLifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // create city objects array
    self.cities = [NSMutableArray new];
    [self loadCityStateImageArray];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];    // update table after any changes
}

#pragma mark - UITableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;
}

// For each object in array load a new tableViewCell with info
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CityCell"];

    City *cities = [self.cities objectAtIndex:indexPath.row];
    cell.textLabel.text = cities.cityName;          // sets the city name as primary on row cell
    cell.detailTextLabel.text = cities.stateName;   // sets the state name as small detail
    cell.imageView.image = cities.cityImage;        // sets the city image to the cell's left

    return cell;
}

// check to make editing changes to row
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// if row can be edited, delete row and update the tableView
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.cities removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}

#pragma mark - Helper Method

// load new city/state/cityImage in Array
- (void)loadCityStateImageArray {
    City *cityOne = [[City alloc] initWithCityName:@"Denver" andStateName:@"Colorado" andCityImage:[UIImage imageNamed:@"Denver"]];

    City *cityTwo = [[City alloc] initWithCityName:@"Houston" andStateName:@"Texas" andCityImage:[UIImage imageNamed:@"Houston"]];

    City *cityThree = [[City alloc] initWithCityName:@"Seattle" andStateName:@"Washington" andCityImage:[UIImage imageNamed:@"Seattle"]];

    City *cityFour = [[City alloc]  initWithCityName:@"San Diego" andStateName:@"California" andCityImage:[UIImage imageNamed:@"SanDiego"]];

    self.cities = [NSMutableArray arrayWithObjects:cityOne, cityTwo, cityThree, cityFour, nil];
}

#pragma mark - UISegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"ShowCitySegue"]) {

        NSIndexPath *index = [self.tableView indexPathForCell:sender];  // table row
        City *city = [self.cities objectAtIndex:index.row];             // access city properties

        DetailViewController *detailVC = segue.destinationViewController;
        detailVC.city = city;           // delegate property
        detailVC.title = city.cityName; // set detailVC navbar title to current city's name
        detailVC.delegate = self;       // reference the delegate
    }
}

#pragma mark -ChangeTitleDelegate

// update the title in the navigation bar
-(void)changeTitleButtonTapped:(NSString *)cityName {
    self.navigationItem.title = cityName;
}

@end




























