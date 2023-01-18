import 'package:flutter/material.dart';

class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  State<Calculate> createState() => _ClassNameState();
}

class _ClassNameState extends State<Calculate> {
  num _emissions = 0.0;
  var txtController = TextEditingController();

  void calculateCounter() {
    setState(() {
      _emissions = double.parse((0.2357 * double.parse(txtController.text.replaceAll(RegExp(r'[^0-9]'),''))).toStringAsFixed(2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Carbon emissions calculator"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
              TextFormField(
                controller: txtController,
                onChanged: (String value) {
                  calculateCounter();
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Used electricity in the last month",
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: false,
                ),
              ),
              const SizedBox(height: 15,),
              Text(
                "You have emitted $_emissions kg of CO2",
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          )
        ),
      ),
    );
  }
}
