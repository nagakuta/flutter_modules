import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:skeletonize_widget/src/widgets/bone/_widget.dart';

void main() {
  testGoldens("CircleBone", (final WidgetTester tester) async {
    await tester.pumpWidgetBuilder(
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: SizedBox.square(dimension: 24.0 * 2),
          ),
          CircleBone(radius: 24),
        ],
      ),
      wrapper: materialAppWrapper(),
      surfaceSize: const Size(120, 60),
    );

    await screenMatchesGolden(tester, "circle/default");
  });
}
