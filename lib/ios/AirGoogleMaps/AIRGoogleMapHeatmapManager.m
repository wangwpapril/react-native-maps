//
//  AIRMapHeatmapManager.m
//  AirMaps
//
//  Created by Admin on 21/06/2017.
//  Copyright © 2017 Christopher. All rights reserved.
//

#import "AIRGoogleMapHeatmapManager.h"

#import <React/RCTBridge.h>
#import <React/RCTConvert.h>
#import <React/RCTConvert+CoreLocation.h>
#import <React/RCTEventDispatcher.h>
#import <React/UIView+React.h>
#import <React/RCTViewManager.h>
#import "AIRGoogleMapHeatmap.h"

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
