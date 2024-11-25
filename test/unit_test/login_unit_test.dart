import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gate_app1/pages/employee_side/leave_management.dart';
import 'package:gate_app1/pages/manager_side/manager.dart';
import 'package:gate_app1/lib/auth/auth_screens/login.dart'; // Update with the correct path

void main() {
  group('LoginScreen Tests', () {
    testWidgets('Displays all widgets correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: LoginScreen()),
      );

      // Verify the presence of widgets
      expect(find.text('GATE APP'), findsOneWidget);
      expect(find.text('Login To The Application'), findsOneWidget);
      expect(find.text('Select Role'), findsOneWidget);
      expect(find.text('Employee ID'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Forgot Password?'), findsOneWidget);
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('Shows error snackbar when fields are empty',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: LoginScreen()),
      );

      // Tap on Login button without entering details
      await tester.tap(find.text('Login'));
      await tester.pump(); // Wait for UI updates

      // Verify Snackbar message
      expect(find.text('Please fill in all fields'), findsOneWidget);
    });

    testWidgets('Shows error snackbar for invalid credentials',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: LoginScreen()),
      );

      // Enter invalid credentials
      await tester.enterText(find.byType(TextField).at(0), 'wrong');
      await tester.enterText(find.byType(TextField).at(1), 'credentials');
      await tester.tap(find.text('Login'));
      await tester.pump(); // Wait for UI updates

      // Verify Snackbar message
      expect(find.text('Invalid login credentials'), findsOneWidget);
    });

    testWidgets('Navigates to LeaveManagementPage for valid Employee login',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginScreen(),
          routes: {
            '/leaveManagement': (context) => LeaveManagementPage(),
          },
        ),
      );

      // Enter valid credentials
      await tester.enterText(find.byType(TextField).at(0), 'test');
      await tester.enterText(find.byType(TextField).at(1), '1234');
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle(); // Wait for navigation

      // Verify navigation
      expect(find.byType(LeaveManagementPage), findsOneWidget);
    });

    testWidgets('Navigates to ManagerLeaveApprovalPage for valid Manager login',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginScreen(),
          routes: {
            '/manager': (context) => ManagerLeaveApprovalPage(),
          },
        ),
      );

      // Select Manager role
      await tester.tap(find.byType(DropdownButtonFormField<String>));
      await tester.pump(); // Wait for dropdown to open
      await tester.tap(find.text('Manager').last); // Select Manager
      await tester.pump();

      // Enter valid credentials
      await tester.enterText(find.byType(TextField).at(0), 'test');
      await tester.enterText(find.byType(TextField).at(1), '1234');
      await tester.tap(find.text('Login'));
      await tester.pumpAndSettle(); // Wait for navigation

      // Verify navigation
      expect(find.byType(ManagerLeaveApprovalPage), findsOneWidget);
    });
  });
}
