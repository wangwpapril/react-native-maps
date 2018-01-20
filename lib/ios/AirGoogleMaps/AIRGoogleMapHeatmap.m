#import "AIRGoogleMapHeatmap.h"

@implementation AIRGoogleMapHeatmap

- (void) setPoints:(NSArray<AIRGoogleMapWeightedPoint *> *)points {
    _points = points;
    
    [self refreshHeatmapData];
}

- (void) refreshHeatmapData {
    NSMutableDictionary *data = [NSMutableDictionary new];
    for(int i = 0; i < _points.count; i++)
    {
        MKMapPoint point = MKMapPointForCoordinate(_points[i].coordinate);
        NSValue *pointValue = [NSValue value:&point
                                withObjCType:@encode(MKMapPoint)];
        data[pointValue] = @(_points[i].weight);
    }
    
    //[self.heatmap setData:data];
}
@end
