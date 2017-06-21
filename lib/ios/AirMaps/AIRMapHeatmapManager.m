//
//  AIRMapHeatmapManager.m
//  AirMaps
//
//  Created by Admin on 21/06/2017.
//  Copyright © 2017 Christopher. All rights reserved.
//

#import "AIRMapHeatmapManager.h"

#import "RCTBridge.h"
#import "RCTConvert.h"
#import "RCTConvert+MoreMapKit.h"
#import "RCTConvert+CoreLocation.h"
#import "RCTEventDispatcher.h"
#import "UIView+React.h"
#import "RCTViewManager.h"
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
