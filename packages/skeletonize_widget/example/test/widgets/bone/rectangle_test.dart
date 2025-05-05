import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';

void main() {
  testGoldens("RectangleBone", (final WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const SizedBox.square(dimension: 48),
          ),
          RectangleBone(
            size: const Size.square(48),
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
      wrapper: materialAppWrapper(),
      surfaceSize: const Size(120, 60),
    );

    await screenMatchesGolden(tester, "rectangle/default");
  });
}
