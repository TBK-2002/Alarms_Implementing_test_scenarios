// 1. on swipe left on every clock tile the tile gets deleted
// 2. when there are no clock tiles left show the following text 'There are no alrams set'
// 3. you can set a new alarm

// description: testing deleting clock tiles
// date: 28/2/2024
// 1. run the application
// 2. swipe left on first dissimisble tile
// 3. if there are more tiles go to step 2
// Expected: Find the 'text there are no alarms set'
// Actual: Found
// Status: Success

// Desciption: test setting an alarm
// date: 28/2/2024
// 1. Run the application
// 2. Press on add button
// // 3. Set the time
// 4. Press on save
// Expected: Clocks list contains one more element
// Actual: length + 1
// Status: Succeful

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ieee_playground/main.dart';
import 'package:ieee_playground/screens/alarm_screen.dart';
import 'package:ieee_playground/widgets/add_alarm.dart';

void main() {
  testWidgets('delete all alarms', (tester) async {
    await tester.pumpWidget(MyApp());
    int i = 0;
    while (clocks.isNotEmpty && i < 50) {
      await tester.drag(find.byType(Dismissible).first, const Offset(-500, 0));
      await tester.pumpAndSettle();
      i++;
    }
    expect(find.text('There are no alarms set'), findsOneWidget);
  });
  testWidgets('add an alarm', (tester) async {
    await tester.pumpWidget(const MyApp());
    int initialCount = clocks.length;

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    while (selectedhour != 6) {
      await tester.drag(
          find.byType(CupertinoPicker).first, const Offset(0, 70));
      await tester.pumpAndSettle();
    }

    while (selectedMinute != 30) {
      await tester.drag(
          find.byType(CupertinoPicker).at(1), const Offset(0, 70));
      await tester.pumpAndSettle();
    }

    await tester.tap(find.bySemanticsLabel('Save'));
    await tester.pumpAndSettle();

    expect(clocks.length, equals(initialCount + 1));
    expect(find.text('06:30'), findsOneWidget);
  });
}
