import React, {Component} from 'react';
import PropTypes from 'prop-types';
import {ViewPropTypes} from 'react-native';
import decorateMapComponent, {
  USES_DEFAULT_IMPLEMENTATION,
  NOT_SUPPORTED,
} from './decorateMapComponent';

const propTypes = {
  ...ViewPropTypes,
  points: PropTypes.arrayOf(PropTypes.shape({
	  latitude: PropTypes.number.isRequired,
	  longitude: PropTypes.number.isRequired,
	  weight: PropTypes.number,
  })),
  radius: PropTypes.number,
  gradient: PropTypes.shape({
    colors: PropTypes.arrayOf(PropTypes.number),
    values: PropTypes.arrayOf(PropTypes.number)
  }),
  opacity: PropTypes.number
};

const defaultProps = {
  points: [],
  radius: 1,
  gradient: {
    colors: [6742272, 16711680],
    values: [0.2, 1.0]
  },
  opacity: 0.7
};

class MapHeatmap extends Component {

  getSanitizedPoints = () => this.props.points.map((point) => ({ weight: 0, ...point }));

	render() {
		const AIRMapHeatmap = this.getAirComponent();
		return (
			<AIRMapHeatmap
				points={this.getSanitizedPoints()}
                radius={this.props.radius}
                gradient={this.props.gradient}
                opacity={this.props.opacity}
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
      ios: NOT_SUPPORTED,
      android: USES_DEFAULT_IMPLEMENTATION,
    },
  },
});