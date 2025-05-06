import 'package:flutter/widgets.dart';

import '/src/_utils/wrapper.dart';
import '/src/widgets/bone/_widget.dart';

/// Skeleton Shader
base class SkeletonShader extends StatefulWidget with SkeletonWrapper {
  // ignore: public_member_api_docs
  const SkeletonShader({
    required this.child,
    this.bone,
    this.addRepaintBoundary = true,
    super.key,
  });

  @override
  @protected
  final Widget child;

  @override
  @protected
  final Bone? bone;

  @override
  @protected
  final bool addRepaintBoundary;
}
