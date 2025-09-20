import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@internal
extension LinearGradientExtension on LinearGradient {
  LinearGradient copyWith({
    final List<Color>? colors,
    final AlignmentGeometry? begin,
    final AlignmentGeometry? end,
    final List<double>? stops,
    final GradientTransform? transform,
  }) => LinearGradient(
    colors: colors ?? this.colors,
    begin: begin ?? this.begin,
    end: end ?? this.end,
    stops: stops ?? this.stops,
    transform: transform ?? this.transform,
  );
}
