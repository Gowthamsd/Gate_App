import 'package:flutter/material.dart';
import 'package:gate_app1/pages/employee_side/leave_management.dart';
import 'package:gate_app1/pages/manager_side/manager.dart';
import 'package:gate_app1/utils/colors.dart';
import 'package:gate_app1/widgets/botton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController employeeIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String selectedRole = 'Employee'; // Default role
  final List<String> roles = ['Employee', 'Security', 'Manager', 'Admin'];

  void _handleLogin(BuildContext context) {
    final String employeeId = employeeIdController.text.trim();
    final String password = passwordController.text.trim();

    if (employeeId.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields")),
      );
      return;
    }

    // Simulate login validation
    if (employeeId == 'test' && password == '1234') {
      // Navigate based on role
      switch (selectedRole) {
        case 'Employee':
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LeaveManagementPage()),
          );
          break;
        case 'Security':
          break;
        case 'Manager':
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ManagerLeaveApprovalPage()),
          );
          break;
        case 'Admin':
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Role not recognized")),
          );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid login credentials")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                "GATE APP",
                style: TextStyle(
                    fontSize: 35,
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            const Center(
              child: Text("Login To The Application"),
            ),

            const SizedBox(
              height: 50,
            ),

            const Text(
              "Select Role",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedRole,
              items: roles.map((role) {
                return DropdownMenuItem(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: AppColors.textFieldBorder),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Employee ID Field
            const Text(
              "Employee ID",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: employeeIdController,
              decoration: InputDecoration(
                hintText: "Enter your Employee ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Password Field
            const Text(
              "Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter your Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Login Button
            Center(
              child: CommonButton(
                  text: "Login", onPressed: () => _handleLogin(context)),
            ),
          ],
        ),
      ),
    );
  }
}
