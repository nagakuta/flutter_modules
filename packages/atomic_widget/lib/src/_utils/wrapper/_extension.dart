import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

@internal
extension EdgeInsetsGeometryExtension on EdgeInsetsGeometry {
  bool get isValid => this != EdgeInsets.zero && isNonNegative;
}
