#import <Foundation/Foundation.h>
#import <GoogleMaps/GoogleMaps.h>
#import "GMUWeightHeatmapTileLayer.h"
#import "GMUHeatmapTileLayer.h"
#import "GMUGradient.h"
#import "GMUWeightedLatLng.h"
#import "AIRGoogleMap.h"

@interface AIRGoogleMapHeatmap: UIView

@property (nonatomic, weak) AIRGoogleMap *map;

@property (nonatomic, strong) GMUWeightHeatmapTileLayer *weightTileLayer;
@property (nonatomic, strong) GMUHeatmapTileLayer *densityTileLayer;
@property (nonatomic, strong) NSArray<GMUWeightedLatLng *> *points;
@property (nonatomic, assign) NSUInteger radius;
@property (nonatomic, strong) GMUGradient *gradient;
@property (nonatomic, assign) CGFloat opacity;
@property (nonatomic, assign) CGFloat maxIntensity;
@property (nonatomic, assign) CGFloat gradientSmoothing;
@property (nonatomic, strong) NSString *heatmapMode;

@end
