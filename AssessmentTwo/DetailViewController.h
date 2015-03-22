//
//  DetailViewController.h
//  AssessmentTwo
//
//  Created by Sherrie Jones on 3/20/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "City.h"

// create Protocol
@protocol DetailViewControllerDelegate <NSObject>
- (void)changeTitleButtonTapped:(NSString *)cityName;
@end



// create Delegate
@interface DetailViewController : UIViewController

// used to change the navigationItem title to current city name
@property City *city;

// must use ChangeTitleDelegate not DetailViewControllerDelegate when referenced
@property (nonatomic, assign) id<DetailViewControllerDelegate>delegate;

@end

























