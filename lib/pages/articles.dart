import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';


final Uri _article1 = Uri.parse("https://www.nationalgeographic.com/environment/article/what-is-a-carbon-footprint-how-to-measure-yours");
final Uri _article2 = Uri.parse("https://www.nytimes.com/guides/year-of-living-better/how-to-reduce-your-carbon-footprint");
final Uri _article3 = Uri.parse("https://www.sciencenews.org/article/climate-change-actions-reduce-carbon-footprint");


class Articles extends StatelessWidget {
  const Articles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "articles",
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Članki"),
          backgroundColor: Colors.grey.shade200,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(itemBuilder: (context, index) {
            return articleBundle();
          },),
        ),
      ),
    );
  }
}


articleBundle() {
  return Column(
    children: [
      const SizedBox(height: 30,),

      GestureDetector(
          onTap: () => _launchUrl(_article3),
          child: Container(
            decoration: ArticleDecoration.containerDecoration(),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image.asset("assets/images/article3.png"),
                  ),
                  Text(
                    "What lifestyle changes will shrink your carbon footprint the most?",
                    style: ArticleDecoration.titleStyle(),
                  ),
                  Text(
                    "Three years ago, Kim Cobb was feeling “completely overwhelmed” by the problem of climate change. Cobb spends her days studying climate change as director of the Global Change Program at Georgia Tech in Atlanta, but she felt paralyzed over how to be part of the solution in her personal life. The barriers felt immense.",
                    style: ArticleDecoration.descStyle(),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ),

      const SizedBox(height: 30,),

      GestureDetector(
        onTap: () => _launchUrl(_article1),
        child: Container(
          decoration: ArticleDecoration.containerDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Image.asset("assets/images/article1.png"),
                ),
                Text(
                  "What is a carbon footprint—and how to measure yours",
                  style: ArticleDecoration.titleStyle(),
                ),
                Text(
                  "As awareness of climate change grows, so does the desire to do something about it. But the scale of the problems it causes—from wildfires to melting glaciers to droughts—can seem utterly overwhelming. It can be hard to make a connection between our everyday lives and the survival of polar bears, let alone how we as individuals can help turn the situation around.",
                  style: ArticleDecoration.descStyle(),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),

      const SizedBox(height: 30,),

      GestureDetector(
        onTap: () => _launchUrl(_article2),
        child: Container(
          decoration: ArticleDecoration.containerDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Image.asset("assets/images/article2.png"),
                ),
                Text(
                  "How to Reduce Your Carbon Footprint",
                  style: ArticleDecoration.titleStyle(),
                ),
                Text(
                  "Climate change can be overwhelming. The science is complex, and when it comes to future impacts, there are still a lot of unknowns. While real solutions will require action on a global scale, there are choices you can make in your day-to-day life to lessen your personal impact on the environment. This guide will walk you through some of them.",
                  style: ArticleDecoration.descStyle(),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}



class ArticleDecoration {
  static LinearGradient getLinearGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        color[300]!,
        color[200]!,
        color[100]!,
      ],
      stops: const [
        0.4,
        0.7,
        0.9,
      ],
    );
  }

  static BoxDecoration containerDecoration() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          spreadRadius: 5,
          blurRadius: 5,
        )
      ],
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      color: Colors.white
    );
  }

  static TextStyle titleStyle() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w900,
      fontSize: 20,
    );
  }

  static TextStyle descStyle() {
    return TextStyle(
      color: Colors.grey.shade700,
      fontWeight: FontWeight.w600,
      fontSize: 15,
      overflow: TextOverflow.fade,
    );
  }
}


Future<void> _launchUrl(Uri _url) async {
  if (!await launchUrl(_url)) {
    throw "Could not open $_url";
  }
}


