import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:gate_app1/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  // Enable integration testing
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('App Integration Test', () {
    testWidgets('Login Flow Test', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Verify login screen widgets
      expect(find.text('GATE APP'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byType(DropdownButtonFormField), findsOneWidget);

      // Simulate user input
      await tester.enterText(
          find.byType(TextField).at(0), 'test'); // Employee ID
      await tester.enterText(find.byType(TextField).at(1), '1234'); // Password

      // Select Role from Dropdown
      await tester.tap(find.byType(DropdownButtonFormField));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Employee').last); // Choose Employee
      await tester.pumpAndSettle();

      // Press the Login Button
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle();

      // Verify navigation to Employee home screen
      expect(find.text('Employee Dashboard'), findsOneWidget);
    });
  });
}
