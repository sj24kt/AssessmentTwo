//
//  DetailViewController.m
//  AssessmentTwo
//
//  Created by Sherrie Jones on 3/20/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "DetailViewController.h"
#import "WikiViewController.h"

@interface DetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UIImageView *cityImageView;
@property (weak, nonatomic) IBOutlet UILabel *wikipediaLabel;
@property (weak, nonatomic) IBOutlet UIButton *changeTitle;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cityTextField.text = self.city.cityName;
    self.stateTextField.text = self.city.stateName;
    self.cityImageView.image = self.city.cityImage;

    self.changeTitle.layer.cornerRadius = 4;
}

# pragma mark - UITextField

// when a new city/state is entered upate the city array
- (IBAction)textFieldDidChanged:(UITextField *)sender {

    if (![self.city.cityName isEqual:self.cityTextField]) {
        self.city.cityName = self.cityTextField.text;
    } else if (![self.city.stateName isEqual:self.stateTextField]) {
        self.city.stateName = self.stateTextField.text;
    }
}

// clears the entire textField on clicking in box
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (![self.cityTextField isEqual:nil]) {
        [self.cityTextField clearsOnBeginEditing];
        self.cityTextField.placeholder = @"enter a city name";

    } else if (![self.stateTextField isEqual:nil]) {
        [self.cityTextField clearsOnBeginEditing];
        self.stateTextField.placeholder = @"enter a state name";
    }
}

// dismisses keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    // dismiss keyboard
    if (self.cityTextField) {
        [self.cityTextField resignFirstResponder];
    } else if (self.stateTextField) {
        [self.stateTextField resignFirstResponder];
    }
    return YES;
}

#pragma mark - UINavigationBar
// if the city name is different from that in the array then
// update the navbar title & the cities array with the newly entered textfield

- (IBAction)changeTitleButtonTapped:(NSString *)cityName {

    self.navigationItem.title = self.cityTextField.text;
    self.navigationItem.title = self.cityTextField.text;
    self.city.cityName = self.cityTextField.text;
}

#pragma mark - UITapGestureRecognizer

// if the tap falls inside the wiki label, segue to wikiVC
- (IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer {

    CGPoint point = [tapGestureRecognizer locationInView:self.view];
    if (CGRectContainsPoint(self.wikipediaLabel.frame, point)) {
        [self performSegueWithIdentifier:@"ShowWikiSegue" sender:nil];
    }
}

#pragma mark -Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"ShowWikiSegue"]) {
        WikiViewController *wikiVC = segue.destinationViewController;
        wikiVC.proxyCity = self.city.cityName;
    }
}





@end





















