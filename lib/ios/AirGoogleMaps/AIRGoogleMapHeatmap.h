//
//  AIRMapHeatmap.h
//  AirMaps
//
//  Created by Admin on 21/06/2017.
//  Copyright © 2017 Christopher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>
#import <Google-Maps-iOS-Utils/GMUHeatmaps.h>
#import "AIRGoogleMap.h"


@interface AIRGoogleMapHeatmap: UIView

@property (nonatomic, weak) AIRGoogleMap *map;

@property (nonatomic, strong) NSArray<AIRGoogleMapWeightedPoint *> *points;
@property (nonatomic, assign) NSInteger radius;
@property (nonatomic, assign) NSInteger gradient;
@property (nonatomic, assign) NSInteger opacity;
@property (nonatomic, assign) NSInteger maxIntensity;
@property (nonatomic, assign) NSInteger gradientSmoothing;
@property (nonatomic, assign) NSInteger heatmapMode;
@property (nonatomic, assign) NSInteger onZoomRadiusChange;

#pragma mark MKOverlay protocol

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, readonly) MKMapRect boundingMapRect;
- (BOOL)canReplaceMapContent;

@end
