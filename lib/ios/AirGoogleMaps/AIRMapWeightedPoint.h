//
//  AIRMapWeightedPoint.h
//  AirMaps
//
//  Created by Admin on 21/06/2017.
//  Copyright © 2017 Christopher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface AIRMapWeightedPoint : NSObject

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, assign) double weight;

@end
