//
//  City.m
//  AssessmentTwo
//
//  Created by Sherrie Jones on 3/20/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import "City.h"


@implementation City

- (instancetype)initWithCityName:(NSString *)cityName
                    andStateName:(NSString *)stateName
                    andCityImage:(UIImage *)cityImage
{
    self = [super init];

    if (self) {
        self.cityName = cityName;
        self.stateName = stateName;
        self.cityImage = cityImage;
    }
    return self;
}

// needed for renaming city and state
- (void)initNewCityName:(NSString *)newName {
    self.cityName = newName;
}

- (void)initNewStateName:(NSString *)newState {
    self.stateName = newState;
}

@end






























