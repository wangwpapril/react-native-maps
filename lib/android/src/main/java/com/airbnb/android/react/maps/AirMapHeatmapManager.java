package com.airbnb.android.react.maps;

import android.util.Log;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.ViewGroupManager;
import com.facebook.react.uimanager.annotations.ReactProp;

public class AirMapHeatmapManager extends ViewGroupManager<AirMapHeatmap> {
    @Override
    public String getName() {
        return "AIRMapHeatmap";
    }

    @Override
    protected AirMapHeatmap createViewInstance(ThemedReactContext reactContext) {
        return new AirMapHeatmap(reactContext);
    }

    @ReactProp(name = "points")
    public void setPoints(AirMapHeatmap view, ReadableArray points) {
        view.setPoints(points);
    }
}
