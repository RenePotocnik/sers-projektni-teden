import 'package:flutter/material.dart';

class TrackEnergy extends StatefulWidget {
  const TrackEnergy({super.key});

  @override
  State<TrackEnergy> createState() => _ClassNameState();
}

class _ClassNameState extends State<TrackEnergy> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("Energy Tracker")),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Transport Type",
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    //
                    _textController.clear();
                  },
                  icon: const Icon(Icons.clear),
                )
              ),
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Travel time",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      //
                      _textController.clear();
                    },
                    icon: const Icon(Icons.clear),
                  )
              ),
            ),
            MaterialButton(
              onPressed: () {
                //
              },
              color: Colors.blue,
              child: const Text("Calculate", style: TextStyle(color: Colors.white))
            )
          ],
        ),
      ),

    );
  }
}