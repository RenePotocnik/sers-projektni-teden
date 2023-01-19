import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../core/res/color.dart';
import '../widgets/circle_gradient_icon.dart';
import '../widgets/option_group.dart';

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
                  height: 10,
                ),
                _taskHeader(),
                const SizedBox(
                  height: 15,
                ),
                buildGrid(),
                const SizedBox(
                  height: 25,
                ),
                usageHeader(),
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
            fontSize: 24,
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
      children: const [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.3,
          child: OptionGroupContainer(
            color: Colors.pink,
            icon: Icons.menu_book_rounded,
            optionGroup: "Računanje količine izpuščenega CO2",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: OptionGroupContainer(
            color: Colors.orange,
            isSmall: true,
            icon: Icons.newspaper,
            optionGroup: "Novice in Članki",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1.3,
          child: OptionGroupContainer(
            color: Colors.green,
            icon: Icons.article,
            optionGroup: "Bread Butter Bread",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: OptionGroupContainer(
            color: Colors.blue,
            isSmall: true,
            icon: Icons.single_bed_sharp,
            optionGroup: "Nekaj druga",
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

// class OnGoingTask extends StatelessWidget {
//   const OnGoingTask({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(
//         20,
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//       width: 100.w,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SizedBox(
//             width: 60.w,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Startup Website Design with Responsive",
//                   style: TextStyle(
//                     color: Colors.blueGrey[700],
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 2,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.timelapse,
//                       color: Colors.purple[300],
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text(
//                       "10:00 AM - 12:30PM",
//                       style: TextStyle(
//                         color: Colors.grey[600],
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 4,
//                     horizontal: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Colors.purple[50],
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   child: const Text(
//                     "Complete - 80%",
//                     style: TextStyle(
//                       color: Colors.purple,
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           const Icon(
//             Icons.rocket_rounded,
//             size: 60,
//             color: Colors.orange,
//           )
//         ],
//       ),
//     );
//   }
// }

