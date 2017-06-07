package com.airbnb.android.react.maps;

import android.content.Context;
import android.util.Log;

import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.TileOverlay;
import com.google.android.gms.maps.model.TileOverlayOptions;
import com.google.maps.android.heatmaps.HeatmapTileProvider;
import com.google.maps.android.heatmaps.WeightedLatLng;

import java.util.ArrayList;
import java.util.List;

public class AirMapHeatmap extends AirMapFeature {

    private TileOverlayOptions tileOverlayOptions;
    private TileOverlay tileOverlay;
    private HeatmapTileProvider heatmapTileProvider;
    private List<WeightedLatLng> points;

    public AirMapHeatmap(Context context) {
        super(context);
    }

    public void setPoints(ReadableArray points){
        this.points = new ArrayList<WeightedLatLng>(points.size());
        for (int i = 0; i < points.size(); i++) {
            ReadableMap point = points.getMap(i);
            WeightedLatLng weightedLatLng;
            LatLng latLng = new LatLng(point.getDouble("latitude"), point.getDouble("longitude"));
            if (point.getDouble("weight") != 0) {
                weightedLatLng = new WeightedLatLng(latLng, point.getDouble("weight"));
            } else {
                weightedLatLng = new WeightedLatLng(latLng);
            }
            this.points.add(i, weightedLatLng);
        }
        if (heatmapTileProvider != null && !this.points.isEmpty()) {
            heatmapTileProvider.setWeightedData(this.points);
        }
        if (tileOverlay != null) {
            tileOverlay.clearTileCache();
        }
    }

    public TileOverlayOptions getTileOverlayOptions() {
        if (tileOverlayOptions == null) {
            tileOverlayOptions = createHeatmapOptions();
        }
        return tileOverlayOptions;
    }

    private TileOverlayOptions createHeatmapOptions() {
        TileOverlayOptions options = new TileOverlayOptions();
        if (heatmapTileProvider == null && this.points != null && !this.points.isEmpty()) {
            heatmapTileProvider = new HeatmapTileProvider.Builder().weightedData(this.points).build();
        }
        // include other options to the heatmap here, for example radius, colours based on the points!
        options.tileProvider(heatmapTileProvider);
        return options;
    }

    @Override
    public void addToMap(GoogleMap map) {
        if(this.points != null && !this.points.isEmpty()){
            tileOverlay = map.addTileOverlay(getTileOverlayOptions());
        }
    }

    @Override
    public void removeFromMap(GoogleMap map) {
        if(tileOverlay != null){
            tileOverlay.remove();
        }
    }

    @Override
    public Object getFeature() {
        return tileOverlay;
    }
}
