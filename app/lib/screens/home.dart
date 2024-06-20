import 'package:flutter/material.dart';

const _maincolor = Color.fromARGB(255, 26, 106, 197);
final _secondcolor = Colors.purple.shade100;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: _maincolor,
        title: Text(
          "Research Assistant",
          style: TextStyle(
            color: _secondcolor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        leading: Row(
          children: [
            const SizedBox(
              width: 14,
            ),
            CircleAvatar(
              backgroundColor: _secondcolor,
              radius: 21,
              child: const Icon(
                Icons.panorama_photosphere,
                color: Colors.black,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                backgroundColor: _secondcolor,
                radius: 66,
                child: const Icon(Icons.panorama_photosphere,
                    color: Colors.black, size: 90)),
            const SizedBox(
              height: 14,
            ),
            Text("Welcome To",
                style: TextStyle(
                    fontSize: 30,
                    color: _secondcolor,
                    fontWeight: FontWeight.w600)),
            Text("Research GPT",
                style: TextStyle(
                    fontSize: 30,
                    color: _secondcolor,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 14,
            ),
            Text("start researching on a paper now",
                style: TextStyle(
                    fontSize: 20,
                    color: _secondcolor,
                    fontWeight: FontWeight.w900)),
            const SizedBox(height: 35,),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: _secondcolor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded button
                  ),
                ),
                child: const Text("Start Chat",
                    style: TextStyle(
                        color: Colors.black, 
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )
                    )
             )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _maincolor,
        currentIndex: 1,
        unselectedIconTheme: IconThemeData(opacity: 0.5,color: Colors.white),
        selectedIconTheme: IconThemeData(opacity: 1, color: Colors.white),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.chat),label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.history_rounded),label: 'History'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile')
        ],
      ),
    );
  }
}
