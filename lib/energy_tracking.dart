import 'package:flutter/material.dart';

class TrackEnergy extends StatefulWidget {
  const TrackEnergy({super.key});

  @override
  State<TrackEnergy> createState() => _ClassNameState();
}

class _ClassNameState extends State<TrackEnergy> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Energy Tracker")),
      body: const Center(
        child: Text(
          "Test text",
          style: TextStyle(
            color: Colors.black,
            fontSize: 40.0,
          )
        )
      ),
    );
  }
}