import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:slipstream/main.dart';
import 'package:slipstream/navigation/gesture_classifier.dart';

void main() {
  test('classifies dominant launcher swipes', () {
    expect(classifySwipe(dx: 120, dy: 10), GestureIntent.productivity);
    expect(classifySwipe(dx: -120, dy: 10), GestureIntent.androidWidgets);
    expect(classifySwipe(dx: 10, dy: -120), GestureIntent.appDrawer);
    expect(classifySwipe(dx: 12, dy: 12), GestureIntent.none);
    expect(classifySwipe(dx: 20, dy: 0), GestureIntent.none);
  });

  testWidgets('home shows only the clock by default', (tester) async {
    await tester.pumpWidget(const SlipstreamApp());

    expect(find.bySemanticsLabel(RegExp('Current time')), findsOneWidget);
    expect(find.text('App drawer'), findsNothing);
    expect(find.text('Our widgets'), findsNothing);
  });

  testWidgets('swiping up opens the app drawer', (tester) async {
    await tester.pumpWidget(const SlipstreamApp());

    await tester.fling(find.byType(SlipstreamApp), const Offset(0, -300), 1000);
    await tester.pump();

    expect(find.text('App drawer'), findsOneWidget);
    expect(find.byKey(const Key('app-search')), findsOneWidget);
  });
}
