import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';

void main() {
  testGoldens("IconBone", (final WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(Icons.abc),
          IconBone(),
        ],
      ),
      wrapper: materialAppWrapper(),
      surfaceSize: const Size(120, 60),
    );

    await screenMatchesGolden(tester, "icon/default");
  });
}
