import React, { PropTypes } from 'react';

import {
  StyleSheet,
  ViewPropTypes,
} from 'react-native';

import decorateMapComponent, {
  USES_DEFAULT_IMPLEMENTATION,
  SUPPORTED,
} from './decorateMapComponent';

const propTypes = {
  ...ViewPropTypes,
  points: PropTypes.arrayOf(PropTypes.shape({
	  latitude: PropTypes.number.isRequired,
	  longitude: PropTypes.number.isRequired,
	  weight: PropTypes.number,
  })),
};

const defaultProps = {
  points: [],
};

class MapHeatmap extends React.Component {
	
	getSanitizedPoints() {
		return this.props.points.map((point) => {
		  return {weight: 1, ...point};
		});
	}
	
	render() {
		const AIRMapHeatmap = this.getAirComponent();
		return (
			<AIRMapHeatmap
				points={this.getSanitizedPoints()}
			/>
		);
	}
}

MapHeatmap.propTypes = propTypes;
MapHeatmap.defaultProps = defaultProps;


module.exports = decorateMapComponent(MapHeatmap, {
  componentType: 'Heatmap',
  providers: {
    google: {
      ios: SUPPORTED,
      android: USES_DEFAULT_IMPLEMENTATION,
    },
  },
});
