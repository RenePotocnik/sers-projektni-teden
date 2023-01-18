import 'package:flutter/material.dart';

import 'calculateCarbonEmissions.dart';
import 'main_page.dart';

import 'site/lib/main2.dart';

void main() {
  runApp(MyApp2());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projektni Teden',
      // Set the theme to the system default; `theme` or `darkTheme`
      theme: ThemeData(primarySwatch: Colors.blue),

      home: const MyHomePage(title: 'SERS ECO - Projektni Teden',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    Calculate(),
    MainPage(),
    Calculate(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(color: Colors.blueAccent, size: 30),
        selectedItemColor: Colors.blueAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        showSelectedLabels: true,
        showUnselectedLabels: false,

        // Update the current selected item on tap
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,


        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: "Calculate",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:"Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:"Bread",
          ),
        ],
      ),
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
    );
  }
}
