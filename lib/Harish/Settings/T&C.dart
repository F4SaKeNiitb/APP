import 'package:flutter/material.dart';

class TermsAndConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Terms & Conditions',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal, // Adjusted color scheme to match ET AL theme
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            'Terms & Conditions',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Welcome to ET AL! These terms and conditions outline the rules and regulations for the use of our research assistant platform. By accessing this app, you accept these terms and conditions in full. Do not continue to use ET AL if you do not accept all of the terms and conditions stated on this page.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "User", "You" and "Your" refers to you, the person accessing this app and accepting the Company\'s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the User in the most appropriate manner, whether by formal meetings of a fixed duration, or any other means, for the express purpose of meeting the User\'s needs in respect of provision of the Company\'s stated services/products, in accordance with and subject to, prevailing law of India.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'We respect your privacy and are committed to protecting it. ET AL uses cookies to improve user experience. By using ET AL, you consent to the use of cookies in accordance with ET AL\'s Privacy Policy.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Unless otherwise stated, ET AL and/or its licensors own the intellectual property rights for all material on ET AL. All intellectual property rights are reserved. You may access this from ET AL for your own personal use subjected to restrictions set in these terms and conditions.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'You must not:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '- Republish material from ET AL',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          Text(
            '- Sell, rent or sub-license material from ET AL',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          Text(
            '- Reproduce, duplicate or copy material from ET AL',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          Text(
            '- Redistribute content from ET AL',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 20),
          Text(
            'This Agreement shall begin on the date hereof. Parts of this app offer an opportunity for users to post and exchange opinions and information in certain areas of the app. ET AL does not filter, edit, publish or review Comments prior to their presence on the app. Comments do not reflect the views and opinions of ET AL, its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, ET AL shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this app.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
