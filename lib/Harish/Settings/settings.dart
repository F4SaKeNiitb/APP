import 'package:flutter/material.dart';
import 'account.dart';
import 'about.dart';
import 'helpandsupport.dart';
import 'T&C.dart';
class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 24, // Customize the font size
          ),
        ),
        backgroundColor: Colors.teal[300], // Customize the AppBar color
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Account'),
            subtitle: Text('Manage your account settings'),
            onTap: () {
              // Navigate to account settings
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Privacy'),
            subtitle: Text('Manage your privacy settings'),
            onTap: () {
              // Navigate to privacy settings
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            subtitle: Text('Manage your notification settings'),
            onTap: () {
              // Navigate to notification settings
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Language'),
            subtitle: Text('Select your preferred language'),
            onTap: () {
              // Navigate to language settings
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.backup),
            title: Text('Backup & Restore'),
            subtitle: Text('Manage your backup and restore options'),
            onTap: () {
              // Navigate to backup and restore settings
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            subtitle: Text('Learn more about ET AL'),
            onTap: () {
              // Navigate to about page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help & Support'),
            subtitle: Text('Get help and support'),
            onTap: () {
              // Navigate to help and support page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpSupportPage()),);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.policy),
            title: Text('Terms & Conditions'),
            subtitle: Text('View terms and conditions'),
            onTap: () {
              // Navigate to terms and conditions page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TermsAndConditionsPage()),);
            },
          ),
        ],
      ),
    );
  }
}
