//
//  City.h
//  AssessmentTwo
//
//  Created by Sherrie Jones on 3/20/15.
//  Copyright (c) 2015 Sherrie Jones. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface City : NSObject
@property NSString *cityName;
@property NSString *stateName;
@property NSString *cityImage;

- (instancetype)initWithCityName:(NSString *)cityName
                    andStateName:(NSString *)stateName
                    andCityImage:(NSString *)cityImage;
@end
