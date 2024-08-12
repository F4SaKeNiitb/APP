import 'package:app/Harish/qa_page.dart';
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
    const ScholarSearchScreen(),
    QA_Screen(),
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
      backgroundColor: const Color(0xFF4D90C6),
      appBar: AppBar(
        title: const Text('ET AL',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: const Color(0xFF176AAC),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 124.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF4D90C6),
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
                Icons.upload_file,
              ),
              title: Text('Submit Paper'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => aero()),
                // );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.analytics,
              ),
              title: Text('Summary & Analysis'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AIML()),
                // );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
              ),
              title: Text('Interactive QnA'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QA_Screen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.code
              ),
              title: Text('LaTeX Code Generation'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => civil()),
                // );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.search,
              ),
              title: Text('Search for Papers'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScholarSearchScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.all_inclusive_rounded,
              ),
              title: Text('Recent Activities'),
              subtitle:Text('Submitted a new paper on AI advancements.'),
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
            icon: Icon(Icons.question_answer),
            label: 'QnA',
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
