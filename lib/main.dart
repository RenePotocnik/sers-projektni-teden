import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'calculateCarbonEmissions.dart';
import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projektni Teden',
      // Set the theme to the system default; `theme` or `darkTheme`
      theme: ThemeData(primarySwatch: Colors.grey),
      // darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.system,

      home: const MyHomePage(title: 'SERS ECO - Projektni Teden',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    Icon(
      Icons.camera,
      size: 150,
    ),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 15,
        selectedIconTheme: const IconThemeData(color: Colors.blueAccent, size: 30),
        selectedItemColor: Colors.blueAccent,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        showSelectedLabels: false,
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
              icon: Icon(Icons.account_balance_rounded),
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
