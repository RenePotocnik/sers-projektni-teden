import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/res/color.dart';
import 'articles.dart';
import 'calculate_carbon_emissions.dart';
import '../widgets/option_group.dart';
import 'suggestions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat.yMMMd().format(DateTime.now()),
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              "assets/svg/sers-eco_logo-cropped.svg",
              semanticsLabel: "SERS ECO",
              width: 60,
            )
          )
        ],
      ),
      extendBody: true,
      body: _buildBody(),
    );
  }

  Stack _buildBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                _taskHeader(),
                const SizedBox(
                  height: 20,
                ),
                buildGrid(),
                const SizedBox(
                  height: 25,
                ),
                // usageHeader(),  ////////////////////////////// uncomment this to get `poraba` below
                const SizedBox(
                  height: 10,
                ),
                // const OnGoingTask(),
                // const SizedBox(
                //   height: 40,
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _taskHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SelectableText(
          "Možnosti",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
          toolbarOptions: const ToolbarOptions(
            copy: true,
            selectAll: true,
          ),
        ),
      ],
    );
  }

  StaggeredGrid buildGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.3,
          child: GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Calculate())
              );
            },
            child: const Hero(
              tag: "co2calculation",
              child: OptionGroupContainer(
                color: Colors.pink,
                icon: Icons.cloud_queue_sharp,
                optionGroup: "Računanje količine izpuščenega CO2",
              ),
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Articles())
              );
            },
            child: const Hero(
              tag: "articles",
              child: OptionGroupContainer(
                color: Colors.orange,
                isSmall: true,
                icon: Icons.newspaper,
                optionGroup: "Novice in Članki",
              ),
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.3,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Suggestions())
              );
            },
            child: const Hero(
              tag: "napotki",
              child: OptionGroupContainer(
                color: Colors.green,
                icon: Icons.article,
                optionGroup: "Napotki za Manjše Onesnaževanje",
              ),
            ),
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: GestureDetector(
            // onTap: () => launchUrl(Uri.parse("https://sk10-prt23.dijak.sersmb.net/")),
            onTap: () => launch("http://sk10-prt23.dijak.sersmb.net/"),
            child: const OptionGroupContainer(
              color: Colors.blue,
              isSmall: true,
              icon: Icons.web,
              optionGroup: "Spletna Stran Projekta ",
            ),
          ),
        ),
      ],
    );
  }

  Row usageHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Poraba",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: Text(
            "Pokaži vse",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}


Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw "Could not open $_url";
  }
}


