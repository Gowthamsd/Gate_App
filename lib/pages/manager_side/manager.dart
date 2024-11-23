import 'package:flutter/material.dart';

class ManagerLeaveApprovalPage extends StatefulWidget {
  @override
  _ManagerLeaveApprovalPageState createState() =>
      _ManagerLeaveApprovalPageState();
}

class _ManagerLeaveApprovalPageState extends State<ManagerLeaveApprovalPage> {
  // Sample leave requests
  List<Map<String, dynamic>> leaveRequests = [
    {
      'employeeName': 'John Doe',
      'type': 'Medical Leave',
      'fromDate': '2024-11-25',
      'toDate': '2024-11-27',
      'status': 'Pending',
    },
    {
      'employeeName': 'Jane Smith',
      'type': 'Casual Leave',
      'fromDate': '2024-11-20',
      'toDate': '2024-11-21',
      'status': 'Pending',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 238, 217, 1),
      appBar: AppBar(
        title: Text('Leave Approval'),
        backgroundColor: Color.fromRGBO(154, 126, 111, 1),
        foregroundColor: Colors.white,
      ),
      body: leaveRequests.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/no_requests.png', // Placeholder image
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'No Leave Requests!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'You don\'t have any pending leave requests.',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: leaveRequests.length,
              itemBuilder: (context, index) {
                final request = leaveRequests[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(
                          request['employeeName'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Leave Type: ${request['type']}'),
                            Text(
                                'Duration: ${request['fromDate']} to ${request['toDate']}'),
                            Text('Total no of days: 2'),
                          ],
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              _updateLeaveStatus(index, 'Approved');
                            },
                            icon: Icon(Icons.check, color: Colors.white),
                            label: Text("Approve"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green.shade300,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              _updateLeaveStatus(index, 'Rejected');
                            },
                            icon: Icon(Icons.close, color: Colors.white),
                            label: Text("Reject"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red.shade300,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8), // Add spacing below the buttons
                    ],
                  ),
                );
              },
            ),
    );
  }

  // Function to update the leave status
  void _updateLeaveStatus(int index, String status) {
    setState(() {
      leaveRequests[index]['status'] = status;
    });

    // Show a confirmation snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Leave request ${status.toLowerCase()} successfully!',
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
