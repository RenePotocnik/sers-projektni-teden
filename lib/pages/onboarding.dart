import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/circle_gradient_icon.dart';
import 'home.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Stack buildBody(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: const _BoardingWidget(),
        ),
        Positioned(
          bottom: -30,
          left: -50,
          child: Image.asset(
            "assets/gifs/waves.gif",
            width: MediaQuery.of(context).size.width * 1 + 100,
          ),
        ),
      ],
    );
  }
}

class _BoardingWidget extends StatelessWidget {
  const _BoardingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        SvgPicture.asset(
          "assets/svg/sers-eco_logo.svg",
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        const SizedBox(
          height: 70,
        ),
        Text(
          "SERS ECO",
          style: TextStyle(
            color: Colors.green[900],
            fontSize: 40,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(
          height: 10,
          width: MediaQuery.of(context).size.height * 1,
        ),
        Text(
          "Pridruži se gibanju 0.0 emisij\n"
          "in sodeluj z S3R5eco",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 70,
        ),
        CircleGradientIcon(
          iconSize: 40,
          color: Colors.blue,
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: ((context) => const HomeScreen())));
          },
          icon: Icons.arrow_right_alt_rounded,
        ),
      ],
    );
  }
}
