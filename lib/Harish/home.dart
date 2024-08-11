import 'package:flutter/material.dart';
import '../Harish/Settings/settings.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _pages =  <Widget>[
    HomeContent(),
    const ScholarSearchScreen(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF176AAC),
      appBar: AppBar(
        title: const Text('ET AL',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xFF176AAC),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const SizedBox(
              height: 124.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.teal,
                ),
                child: Text(
                  'Fields',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'MyFont2',
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,

              ),
              title: Text('Aerospace'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('AI/ML'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Chemical'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Civil'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Data Science'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Electrical and Electronics'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Finance'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Management'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Marketing'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Mechanical'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Networking'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Physics'),
              onTap: () {
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Software Development'),
              onTap: () {
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF176AAC),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
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
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
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
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
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
