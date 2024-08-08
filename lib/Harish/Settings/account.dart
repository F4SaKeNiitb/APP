import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController linkedDetailsController = TextEditingController();

  bool _isEditing = false; // Flag to check if editing mode is active

  @override
  void initState() {
    super.initState();
    // Replace with actual data retrieval logic or default values
    nameController.text = "John Doe";
    emailController.text = "john.doe@example.com";
    phoneController.text = "1234567890";
    linkedDetailsController.text = "https://linkedin.com/johndoe";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text(
          'Account',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              setState(() {
                _isEditing = true;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Account Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              TextFormField(
                controller: nameController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              TextFormField(
                controller: emailController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              TextFormField(
                controller: phoneController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Linked Details',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              TextFormField(
                controller: linkedDetailsController,
                enabled: _isEditing,
                decoration: InputDecoration(
                  hintText: 'Enter your linked details (e.g., LinkedIn, GitHub)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isEditing
                    ? () {
                        setState(() {
                          _isEditing = false;
                        });
                      }
                    : null,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
