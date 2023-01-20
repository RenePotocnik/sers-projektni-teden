import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';


final Uri _article1 = Uri.parse("https://www.dostop.si/kako-zmanjsati-onesnazevanje/");
final Uri _article2 = Uri.parse("https://rubirudi.com/12-nacinov-za-zmanjsanje-onesnazevanja-okolja/");
final Uri _article3 = Uri.parse("https://www.visit-postojna.si/si/moja-zelena-obcina/nasveti-za-obcane/nasveti-kako-lahko-sami-zmanjsamo-odtis");


class Suggestions extends StatelessWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "napotki",
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Nasveti"),
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
        onTap: () => _launchUrl(_article1),
        child: Container(
          decoration: ArticleDecoration.containerDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  child: Image.asset("assets/images/suggestion1.png"),
                ),
                Text(
                  "Kako zmanjšati onesnaževanje?",
                  style: ArticleDecoration.titleStyle(),
                ),
                Text(
                  "Mladi so z nenehnimi protesti pozivali voditelje, vplivneže in podjetja k ukrepanju v smeri trajnostnega razvoja in varovanju okolja. Sprememba zakonov in delovanja podjetij je glavni korak do varovanja okolja, ki pa ga je zelo težko doseči. Kaj pa lahko pri tem naredimo sami?",
                  style: ArticleDecoration.descStyle(),
                  maxLines: 3,
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
                  child: Image.asset("assets/images/suggestion2.png"),
                ),
                Text(
                  "12 načinov za zmanjšanje onesnaževanja okolja",
                  style: ArticleDecoration.titleStyle(),
                ),
                Text(
                  "Ste kdaj pomislili kakšen je vaš ogljični odtis? Kaj pa ogljični odtis vaše družine?  Kaj delate pravilno in kaj bi radi spremenili?",
                  style: ArticleDecoration.descStyle(),
                  maxLines: 3,
                ),
              ],
            ),
          ),
        ),
      ),

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
                  child: Image.asset("assets/images/suggestion3.png"),
                ),
                Text(
                  "NASVETI - KAKO LAHKO SAMI ZMANJŠAMO ODTIS?",
                  style: ArticleDecoration.titleStyle(),
                ),
                Text(
                  "Ljudje že od začetka revolucije digitalnih medijih razpravljajo o okoljskih stroških spremljanja novic na spletu in branja tiskanega papirja. Časopisi po eni izmed študij povzročajo približno njihovo težo pri emisijah ogljika. Po drugi strani pa, da brskanje po spletu troši energijo, katere količina se razlikuje glede na napravo, ki jo uporabljate. Kadar gre za spremljanje novic, je treba upoštevati najboljšo politiko. Če ste naročeni na tiskalni papir, ne pozabite reciklirati. Če so spletne novice vaš najljubši medij, za večino časa brskanja izberite izklopljen prenosni računalnik ali e-bralnik, ne pa vtično napravo.",
                  style: ArticleDecoration.descStyle(),
                  maxLines: 3,
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


