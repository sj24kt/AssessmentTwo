//
//  DetailViewController.h
//  AssessmentTwo
//
//  Created by Sherrie Jones on 3/20/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

@interface DetailViewController : UIViewController

@property City *city;

@property NSString *cityName;
@property NSString *stateName;
@property NSString *cityImage;

@property NSString *denverImage;
@property NSString *houstonImage;
@property NSString *seattleImage;
@property NSString *sandiegoImage;

- (void)deleteCity;

@end

























