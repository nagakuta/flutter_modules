// ignore_for_file: constant_identifier_names, public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@internal
const Color BASE_COLOR = Color(0xFFEBEBF4);

@internal
const Color HIGHLIGHT_COLOR = Color(0xFFF4F4F4);

extension type const ShimmerEffect._(LinearGradient gradient) implements LinearGradient {
  ShimmerEffect({
    final List<Color> colors = const <Color>[BASE_COLOR, HIGHLIGHT_COLOR, BASE_COLOR],
    final AlignmentGeometry begin = const Alignment(-1, -0.3),
    final AlignmentGeometry end = const Alignment(1, 0.3),
    final List<double> stops = const <double>[0.1, 0.3, 0.4],
    final GradientTransform? transform,
  }) : gradient = LinearGradient(colors: colors, begin: begin, end: end, stops: stops, transform: transform);
}
