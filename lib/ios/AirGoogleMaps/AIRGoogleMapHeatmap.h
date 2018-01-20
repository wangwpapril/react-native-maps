//
//  AIRMapHeatmap.h
//  AirMaps
//
//  Created by Admin on 21/06/2017.
//  Copyright © 2017 Christopher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>
#import <Google-Maps-iOS-Utils/GMUWeightHeatmapTileLayer.h>
#import <Google-Maps-iOS-Utils/GMUGradient.h>
#import "AIRGoogleMapWeightedPoint.h"
#import "AIRGoogleMap.h"

@interface AIRGoogleMapHeatmap: UIView

@property (nonatomic, weak) AIRGoogleMap *map;

@property (nonatomic, strong) NSArray<AIRGoogleMapWeightedPoint *> *points;
@property (nonatomic, assign) NSUInteger radius;
@property (nonatomic, assign) GMUGradient *gradient;
@property (nonatomic, assign) CGFloat opacity;
@property (nonatomic, assign) CGFloat maxIntensity;
@property (nonatomic, assign) CGFloat gradientSmoothing;
@property (nonatomic, assign) NSString *heatmapMode;

@end
