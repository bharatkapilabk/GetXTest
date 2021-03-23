// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getxtest/activities/home_screen.dart';
import 'package:getxtest/activities/login_screen.dart';

import 'package:getxtest/main.dart';

void main() {
  testWidgets('Test to see the GetMaterialApp is inside widget tree',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('To see center widget in widget tree',
      (WidgetTester tester) async {
    await tester.pumpWidget(GetMaterialApp(home: LoginScreen()));

    expect(find.byType(Column), findsWidgets);
  });

  group('Application Logic', () {
    testWidgets('Enter values', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        home: LoginScreen(),
      ));
      final emailFieldFinder = find.byKey(const Key('email-field'));
      final passwordFieldFinder = find.byKey(const Key('password-field'));
      final buttonFinder = find.byKey(const Key('login-button'));

      await tester.enterText(emailFieldFinder, 'bharat@gmail.com');
      await tester.enterText(passwordFieldFinder, 'Bharat@123');
      await tester.tap(buttonFinder);

      // await tester.pump();
      expect(find.byKey(const Key('login-button')),findsOneWidget);
      // expect(find.byType(ElevatedButton), findsNothing);
    });
  });

  group('Home Screen', () {
    testWidgets('Testing Home', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: HomeScreen()));
      expect(find.byType(Center), findsOneWidget);
      // expect(find.byType(Text), findsOneWidget);
    });
  });
  testWidgets('To see center widget in widget tree',
          (WidgetTester tester) async {
        await tester.pumpWidget(GetMaterialApp(home: HomeScreen()));

        expect(find.byType(Center), findsOneWidget);
      });
}
