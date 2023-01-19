import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/res/color.dart';

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
    return Hero(
      tag: "co2calculation",
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Računanje količine CO2"),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Emisije iz proizvodnje električne energije izračunamo z emisijskimi faktorji EPA eGRID na podlagi podatkov iz leta 2020, objavljenih leta 2022, z uporabo povprečnih emisij vira električne energije v ZDA 0,818 lbs CO2e na kWh (0,371 kg CO2e na kWh).",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey.shade900,
                  ),
                ),
                SizedBox(height: 15,),

                Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.getDarkLinearGradient(Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: ElevatedButton(
                    onPressed: () => _launchUrl(Uri.parse("https://carbonfund.org/calculation-methods/")),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(100, 50)),
                      backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                      // elevation: MaterialStateProperty.all(3),
                      shadowColor:
                      MaterialStateProperty.all(Colors.transparent),
                    ),

                    child: const Text("Metode Izračuna",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),),
                    ),
                ),

                const SizedBox(height: 100,),

                TextFormField(
                  controller: txtController,
                  onChanged: (String value) {
                    calculateCounter();
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Vnesi porabo elektrike v kWh",
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: false,
                  ),
                ),
                const SizedBox(height: 15,),
                Text(
                  "Proizvedli ste $_emissions kg CO2",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}


Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw "Could not open $_url";
  }
}

