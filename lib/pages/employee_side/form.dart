import 'package:flutter/material.dart';

class LeaveFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(233, 238, 217, 1),
      appBar: AppBar(
        title: Text('Leave Form'),
        backgroundColor: Color.fromRGBO(154, 126, 111, 1),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Information
              const ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(''), // Replace with actual image
                ),
                title: Text('Gowtham M'),
                subtitle: Text('Production Department'),
              ),
              const SizedBox(height: 20),

              // Leave Type
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: 'Leave Type',
                  border: OutlineInputBorder(),
                ),
                items: ['Medical Leave', 'Casual Leave', 'Other'].map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  // Handle change
                },
              ),
              SizedBox(height: 20),

              // Date Range
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'From Date',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () {
                        // Show date picker
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'To Date',
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.calendar_today),
                      ),
                      readOnly: true,
                      onTap: () {
                        // Show date picker
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Half-Day Checkbox
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Handle change
                    },
                  ),
                  Text('Half day'),
                ],
              ),
              SizedBox(height: 20),

              // Reason
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter the reason',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),

              // Attachments
              Text(
                'Attachments',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  // Handle file picker
                },
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload, size: 40, color: Colors.blue),
                        Text(
                          'Tap to upload',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'The maximum file size allowed is 20MB.\nSupported formats: xlsx, doc, pdf, png, jpg.',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(84, 71, 63, 1),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      // Handle apply action
                    },
                    child: Text('Apply'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
