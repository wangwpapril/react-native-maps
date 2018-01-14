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

#import "RCTConvert+AirMap.h"
#import <React/RCTComponent.h>
#import "AIRMapWeightedPoint.h"

#import "AIRMap.h"
#import <React/RCTView.h>

@interface AIRMapHeatmap: MKAnnotationView <MKOverlay>

@property (nonatomic, weak) AIRMap *map;

@property (nonatomic, strong) DTMHeatmap *heatmap;
@property (nonatomic, strong) MKOverlayRenderer *renderer;
@property (nonatomic, strong) NSArray<AIRMapWeightedPoint *> *points;
@property (nonatomic, assign) NSInteger radius;
@property (nonatomic, strong) NSInteger gradient;
@property (nonatomic, strong) NSInteger opacity;
@property (nonatomic, strong) NSInteger maxIntensity;
@property (nonatomic, strong) NSString gradientSmoothing;
@property (nonatomic, strong) NSInteger heatmapMode;
@property (nonatomic, strong) NSInteger onZoomRadiusChange;

#pragma mark MKOverlay protocol

@property(nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property(nonatomic, readonly) MKMapRect boundingMapRect;
- (BOOL)canReplaceMapContent;

@end
