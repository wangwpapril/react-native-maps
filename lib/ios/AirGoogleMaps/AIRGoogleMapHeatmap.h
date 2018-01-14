//
//  AIRMapHeatmap.h
//  AirMaps
//
//  Created by Admin on 21/06/2017.
//  Copyright © 2017 Christopher. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>
#import <UIKit/UIKit.h>

#import <React/RCTComponent.h>
#import "AIRGoogleMapWeightedPoint.h"

#import "AIRGoogleMap.h"
#import <React/RCTView.h>

@interface AIRGoogleMapHeatmap: MKAnnotationView <MKOverlay>

@property (nonatomic, weak) AIRGoogleMap *map;

@property (nonatomic, strong) MKOverlayRenderer *renderer;
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
