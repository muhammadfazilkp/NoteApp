import 'package:flutter/material.dart';
import 'package:note_app/view/presentation/screens/homescreen/homescreen.dart';


class BottomNavigatonPage extends StatefulWidget {
  const BottomNavigatonPage({super.key});

  @override
  State<BottomNavigatonPage> createState() => _BottomNavigatonPageState();
}

int currentIndex = 0;
final List<Widget> pages = [
  const HomeScreen(),
 
];

class _BottomNavigatonPageState extends State<BottomNavigatonPage> {
  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 20,
          selectedIconTheme:
          
          const IconThemeData(color: Colors.amberAccent, size: 40),
          selectedItemColor: Colors.amberAccent,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          items: <BottomNavigationBarItem>[
            
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                  backgroundColor: Colors.blueGrey[200],
                  child: const Icon(Icons.add)),
              label: 'Add Note',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts_rounded),
              label: 'profile',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          }),
    );
  }
}