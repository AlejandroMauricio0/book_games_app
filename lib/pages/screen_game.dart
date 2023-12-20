import 'package:birds_app/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../data/home_data.dart';

class ScreenGame extends StatefulWidget {
  final indice;
  const ScreenGame({super.key, this.indice});

  @override
  State<ScreenGame> createState() => _ScreenGameState();
}

class _ScreenGameState extends State<ScreenGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(title: Text(gameDataList[widget.indice].name)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(gameDataList[widget.indice].image),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 120,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(188, 0, 0, 0),
                    Color.fromARGB(164, 0, 0, 0),
                    Color.fromARGB(66, 0, 0, 0),
                    // Colors.transparent,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Expanded(
                        child: TextUtil(
                          text: " ${gameDataList[widget.indice].name}",
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 0, 0),
                    Color.fromARGB(215, 0, 0, 0),
                    Color.fromARGB(188, 0, 0, 0),
                    Color.fromARGB(163, 0, 0, 0),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 21),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextUtil(
                        text: "Categories: ",
                        size: 20,
                        // color: Colors.blue,
                        weight: true,
                      ),
                      TextUtil(
                        text: "Acción",
                        size: 20,
                        color: Colors.red,
                        weight: true,
                      ),
                      const Spacer(),
                      const Icon(
                        Iconsax.game4,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                  const Spacer(),
                  RichText(
                    text: TextSpan(
                      text: gameDataList[widget.indice].age,
                      style: const TextStyle(
                        color: Colors
                            .white, // Puedes ajustar el color según tus preferencias
                        fontSize: 17,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.0,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          child: Text(
                            "${gameDataList[widget.indice].descrption}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     // Navigator.of(context).push(MaterialPageRoute(
                      //     //     builder: (context) => const HomeScreen()));
                      //   },
                      //   child: Container(
                      //     height: 55,
                      //     width: 55,
                      //     decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         border: Border.all(color: Colors.white)),
                      //     child: const Icon(
                      //       Icons.arrow_forward,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
