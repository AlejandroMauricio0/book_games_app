import 'package:birds_app/data/home_data.dart';
import 'package:birds_app/utils/text_util.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'screen_game.dart';

List<String> categoryList = ["Action", "Adventure", "Others"];
int selectedIndex = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -150,
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Color(0xfff8b3dff), blurRadius: 200)
                  ]),
              alignment: Alignment.center,
              child: SizedBox(
                height: 100,
                width: 100,
                child: Container(
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Color(0xfff8b3dff), blurRadius: 200)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: -100,
            bottom: -150,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(color: Color(0xfff8b3dff), blurRadius: 200),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Iconsax.game,
                        color: Colors.white,
                        size: 35,
                      ),
                      Expanded(
                        child: TextUtil(
                          text: 'Book',
                          size: 28,
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white)),
                        child: const Icon(
                          Icons.notes,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      TextUtil(
                        text: "Welcome ",
                        size: 20,
                        color: Colors.amber,
                      ),
                      TextUtil(
                        text: "Alejandro",
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const Spacer(),
                  TextUtil(
                    text: "Hello, What game would you like to know about?",
                    size: 20,
                    weight: true,
                  ),
                  const Spacer(),
                  Center(
                    child: SizedBox(
                      height: 35,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryList.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(120),
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.transparent,
                            ),
                            alignment: Alignment.center,
                            child: TextUtil(
                              text: categoryList[index],
                              weight: true,
                              color: selectedIndex == index
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const Spacer(),
                  // cards
                  SizedBox(
                    height: 210,
                    child: ListView.builder(
                      itemCount: gameDataList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          width: 120,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 40, 40, 40),
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image:
                                        AssetImage(gameDataList[index].image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextUtil(
                                        text: gameDataList[index].name,
                                        size: 14,
                                        weight: true,
                                      ),
                                      TextUtil(
                                        text: gameDataList[index].age,
                                        size: 11,
                                        weight: true,
                                        color: Colors.grey,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          goToScreenGame(index);
                                        },
                                        child: TextUtil(
                                          text: "Show more...",
                                          size: 14,
                                          weight: true,
                                          color: Colors.orange,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  TextUtil(
                    text: "Video",
                    size: 25,
                    weight: true,
                  ),
                  TextUtil(
                    text: "Experience how our birds live",
                    size: 12,
                    color: Colors.white54,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: gameVideoList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 200,
                          width: 150,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(gameVideoList[index].image),
                                fit: BoxFit.fill),
                          ),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              Container(
                                height: 15,
                                width: 45,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(120),
                                    color: Colors.black38),
                                alignment: Alignment.center,
                                child: TextUtil(
                                  text: "2:03",
                                  weight: true,
                                  size: 10,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToScreenGame(index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ScreenGame(indice: index)),
    );
  }
}
