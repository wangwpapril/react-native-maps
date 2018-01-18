//
//  AIRMapHeatmapManager.m
//  AirMaps
//
//  Created by Admin on 21/06/2017.
//  Copyright © 2017 Christopher. All rights reserved.
//

#import "AIRGoogleMapHeatmapManager.h"
#import "AIRGoogleMapHeatmap.h"
#import <MapKit/MapKit.h>
#import <React/RCTUIManager.h>
#import "RCTConvert+AirMap.h"

@implementation AIRGoogleMapHeatmapManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    AIRGoogleMapHeatmap *heatmap = [AIRGoogleMapHeatmap new];
    return heatmap;
}

RCT_EXPORT_VIEW_PROPERTY(points, AIRMapWeightedPointArray)
RCT_EXPORT_VIEW_PROPERTY(radius, NSInteger)


@end
