import 'package:flutter/material.dart';
import 'package:app/Harish/profile/profile.dart';
import 'package:app/Harish/Settings/settings.dart';
import 'package:app/Harish/user/logout.dart';
import 'paper_submission_page.dart';
import 'summary_analysis_page.dart';
import 'qa_page.dart';
import 'latex_editor_page.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static List<Widget> _pages = <Widget>[
    HomeContent(),
    PaperSubmissionPage(),
    SummaryAnalysisPage(),
    QAPage(),
    LatexEditorPage(),
    SearchPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onLogoTapped() {
    setState(() {
      _selectedIndex = 0; // Navigate to home page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        title: Text('ET AL - Your Research Assistant'),
        backgroundColor: Colors.teal,
        leading: GestureDetector(
          onTap: _onLogoTapped,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('lib/Images/logo.png', height: 50),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal[100],
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.teal[100],
              radius: 21,
              child: const Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal[100],
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LogoutPage()),
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors.teal[100],
              radius: 21,
              child: const Icon(
                Icons.logout_rounded,
                color: Colors.black,
                size: 28,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload_file),
            label: 'Submit Paper',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Summary & Analysis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            label: 'Q&A',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.code),
            label: 'LaTeX',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.teal[300],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Welcome to ET AL!',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Text(
            'An app to assist you with research paper submissions, summaries, Q&A, LaTeX code generation, and more.',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 20.0),
          Text(
            'Key Features',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          FeatureTile(
            icon: Icons.upload_file,
            title: 'Submit Paper',
            subtitle: 'Easily submit your research papers.',
          ),
          FeatureTile(
            icon: Icons.analytics,
            title: 'Summary & Analysis',
            subtitle: 'Get summaries and analyses of papers.',
          ),
          FeatureTile(
            icon: Icons.question_answer,
            title: 'Interactive Q&A',
            subtitle: 'Engage in Q&A sessions about your research.',
          ),
          FeatureTile(
            icon: Icons.code,
            title: 'LaTeX Code Generation',
            subtitle: 'Generate LaTeX code for your papers.',
          ),
          FeatureTile(
            icon: Icons.search,
            title: 'Search for Papers',
            subtitle: 'Find papers relevant to your research.',
          ),
          SizedBox(height: 20.0),
          Text(
            'Recent Activities',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          RecentActivityTile(
            activity: 'Submitted a new paper on AI advancements.',
            time: '2 hours ago',
          ),
          RecentActivityTile(
            activity: 'Generated LaTeX code for a research paper.',
            time: '1 day ago',
          ),
          RecentActivityTile(
            activity: 'Analyzed 5 new research papers.',
            time: '2 days ago',
          ),
        ],
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  FeatureTile({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal, size: 40.0),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}

class RecentActivityTile extends StatelessWidget {
  final String activity;
  final String time;

  RecentActivityTile({required this.activity, required this.time});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.check_circle, color: Colors.teal),
      title: Text(activity),
      subtitle: Text(time),
      contentPadding: EdgeInsets.symmetric(vertical: 4.0),
    );
  }
}
