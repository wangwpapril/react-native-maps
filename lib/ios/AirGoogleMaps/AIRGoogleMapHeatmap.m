#import "AIRGoogleMapHeatmap.h"

@implementation AIRGoogleMapHeatmap

- (instancetype)init
{
    if ((self = [super init])) {
        _densityTileLayer = [[GMUHeatmapTileLayer alloc] init];
        _weightTileLayer = [[GMUWeightHeatmapTileLayer alloc] init];
        _heatmapMode = @"POINTS_DENSITY";
    }
    return self;
}

- (void) refreshHeatmap {
    if([_heatmapMode isEqualToString: @"POINTS_DENSITY"]) {
        //        [_densityTileLayer clearTileCache];
        //        [self setMap:_map];
        [self.densityTileLayer clearTileCache];
        [self.densityTileLayer setMap:self.densityTileLayer.map];
        
    } else {
        [_weightTileLayer clearTileCache];
        //        [self setMap:_map];
        [self.weightTileLayer setMap:self.weightTileLayer.map];
    }
}

- (void) setPoints:(NSArray<GMUWeightedLatLng *> * _Nonnull)points {
    _points = points;
    NSLog(@"setPoints (points size): %d", [_points count]);
    [self.densityTileLayer setWeightedData:points];
    [self refreshHeatmap];
}

- (void) setRadius:(NSUInteger)radius {
    _radius = radius;
    NSLog(@"radius size: %tu", radius);
    [self.densityTileLayer setRadius:radius];
    [self refreshHeatmap];
}

- (void) setMaxIntensity:(CGFloat)maxIntensity {
    _maxIntensity = maxIntensity;
    [self refreshHeatmap];
}

- (void) setOpacity:(CGFloat)opacity {
    _opacity = opacity;
    [self.densityTileLayer setOpacity:opacity];
    [self refreshHeatmap];
}

- (void) setGradient:(GMUGradient *)gradient {
    _gradient = gradient;
    [self.densityTileLayer setGradient:gradient];
    [self refreshHeatmap];
}

- (void) setGradientSmoothing:(CGFloat)gradientSmoothing {
    _gradientSmoothing = gradientSmoothing;
    [self refreshHeatmap];
}

- (void)setMap:(AIRGoogleMap *)map {
    _map = map;
    if(map == nil) {
        if(_weightTileLayer != nil) {
            _weightTileLayer.map = nil;
        } else if(_densityTileLayer != nil) {
            _densityTileLayer.map = nil;
        }
    } else {
        if([_heatmapMode isEqualToString: @"POINTS_DENSITY"]) {

            NSLog(@"heatmap radius size: %tu", _radius);
            [_densityTileLayer clearTileCache];
            _densityTileLayer.weightedData = _points;
            _densityTileLayer.radius = _radius;
            _densityTileLayer.gradient = _gradient;
            _densityTileLayer.opacity = _opacity;

            _densityTileLayer.map = map;
//            [_weightTileLayer clearTileCache];
            _weightTileLayer.map = nil;
            [_densityTileLayer clearTileCache];
        } else {
            NSLog(@"points size: %d", [_points count]);
            _weightTileLayer.weightedData = _points;
            _weightTileLayer.radius = _radius;
            _weightTileLayer.staticMaxIntensity = _maxIntensity;
            _weightTileLayer.gradient = _gradient;
            _weightTileLayer.gradientSmoothing = _gradientSmoothing;
            _weightTileLayer.map = map;
//            [_densityTileLayer clearTileCache];
            _densityTileLayer.map = nil;
        }
    }
}

- (void)setHeatmapMode:(NSString *)heatmapMode {
    _heatmapMode = heatmapMode;
    [self refreshHeatmap];
}

@end
