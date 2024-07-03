import 'package:flutter/material.dart';
import 'package:app/screens/edit_profile.dart';
import 'package:app/screens/profile_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Consumer<ProfileProvider>(
          builder: (context, profile, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // Add functionality to change profile image
                  },
                  child: Icon(
                    Icons.account_box_rounded,
                    size: 60, // Adjust size of the icon
                    color: Colors.blueGrey,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  profile.name,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  profile.jobTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EditProfilePage()),
                    );

                    if (result != null && result is Map<String, String>) {
                      Provider.of<ProfileProvider>(context, listen: false)
                          .updateProfile(result['name']!, result['jobTitle']!);
                    }
                  },
                  child: Text('Edit Profile'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
