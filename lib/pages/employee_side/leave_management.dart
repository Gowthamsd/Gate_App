import 'package:flutter/material.dart';
import 'package:gate_app1/pages/employee_side/form.dart';

class LeaveManagementPage extends StatelessWidget {
  // Sample leave records
  final List<Map<String, dynamic>> leaveRecords = [
    {
      'type': 'Medical Leave',
      'fromDate': '2024-11-15',
      'toDate': '2024-11-17',
      'status': 'Approved',
    },
    {
      'type': 'Casual Leave',
      'fromDate': '2024-11-18',
      'toDate': '2024-11-19',
      'status': 'In Progress',
    },
    {
      'type': 'Personal Leave',
      'fromDate': '2024-11-10',
      'toDate': '2024-11-12',
      'status': 'Rejected',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 238, 217, 1),
      appBar: AppBar(
        title: Text('Leave Management'),
        backgroundColor: Color.fromRGBO(154, 126, 111, 1),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Handle filter action
            },
          ),
        ],
      ),
      body: leaveRecords.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no_leaves.png', // Add your placeholder image
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Whoops!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'No leave found.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: leaveRecords.length,
              itemBuilder: (context, index) {
                final leave = leaveRecords[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      leave['type'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '${leave['fromDate']} - ${leave['toDate']}',
                    ),
                    trailing: Chip(
                      label: Text(
                        leave['status'],
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      backgroundColor: _getStatusColor(leave['status']),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LeaveFormPage()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  // Helper function to get status color
  Color _getStatusColor(String status) {
    switch (status) {
      case 'Approved':
        return Colors.green.shade300;
      case 'Rejected':
        return Colors.red.shade300;
      case 'In Progress':
        return Colors.orange.shade300;
      default:
        return Colors.grey;
    }
  }
}
