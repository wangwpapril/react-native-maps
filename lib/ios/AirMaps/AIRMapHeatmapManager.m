//
//  AIRMapHeatmapManager.m
//  AirMaps
//
//  Created by Admin on 21/06/2017.
//  Copyright © 2017 Christopher. All rights reserved.
//

#import "AIRMapHeatmapManager.h"

#import <ReactRCTBridge.h>
#import <ReactRCTConvert.h>
#import <ReactRCTConvert+CoreLocation.h>
#import <ReactRCTEventDispatcher.h>
#import <ReactUIView+React.h>
#import <ReactRCTViewManager.h>
#import "AIRMapHeatmap.h"

@interface AIRMapHeatmapManager()

@end

@implementation AIRMapHeatmapManager

RCT_EXPORT_MODULE()

- (UIView *)view
{
    AIRMapHeatmap *heatmap = [AIRMapHeatmap new];
    return heatmap;
}

RCT_EXPORT_VIEW_PROPERTY(points, AIRMapWeightedPointArray)

@end
