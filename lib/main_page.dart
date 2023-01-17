import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'calculateCarbonEmissions.dart';


class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            'assets/svg/sers-eco_logo.svg',
            width: MediaQuery.of(context).size.width * 1,
          ),
          const FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              "SERS Projektni Teden",
            ),
          )

          // // Button to navigate user to `calculateCarbonEmissions`
          // TextButton(
          //   style: ButtonStyle(
          //     // backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade900),
          //     foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          //       RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(100.0),
          //           side: BorderSide(
          //             color: Colors.grey.shade900,
          //             width: 5,
          //           )
          //
          //       ),
          //     ),
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const Calculate()),
          //     );
          //   },
          //   child: const Padding(
          //     padding: EdgeInsets.all(10.0),
          //     child: Text(
          //       'Calculate CO2 emissions',
          //       style: TextStyle(
          //         fontSize: 20,
          //         fontWeight: FontWeight.w900,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
