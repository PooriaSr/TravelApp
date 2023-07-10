import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/Models/CityModels.dart';
import 'dart:developer' as developer;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // Farsi
      ],
      theme: ThemeData(
          fontFamily: 'iransans',
          textTheme: const TextTheme(
              displaySmall: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
              displayMedium: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 32,
                  fontWeight: FontWeight.w700))),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  List Liked = [];
  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    double imageSize = 75;
    for (int i = 0; i < citiesList.length; i++) {
      Liked.add(citiesList[i].liked);
    }
    ;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          //section 1
          SizedBox(
            width: double.infinity,
            height: phoneSize.height / 1.8,
            child: Stack(children: [
              //City Image
              Container(
                width: double.infinity,
                height: phoneSize.height / 2.1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(citiesList[selectedIndex].image),
                        fit: BoxFit.cover),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(70),
                      bottomRight: Radius.circular(70),
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    )),
              ),
              //Head Icon
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(74, 119, 119, 119),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        CupertinoIcons.arrow_left,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (Liked[selectedIndex] == false) {
                            Liked[selectedIndex] = true;
                          } else {
                            Liked[selectedIndex] = false;
                          }
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(74, 119, 119, 119),
                          shape: BoxShape.circle,
                        ),
                        child: Liked[selectedIndex] == false
                            ? const Icon(
                                CupertinoIcons.heart,
                                color: Colors.black,
                              )
                            : const Icon(
                                CupertinoIcons.heart_fill,
                                color: Colors.black,
                              ),
                      ),
                    )
                  ],
                ),
              ),
              //City List
              Positioned(
                top: 85,
                right: 0,
                child: SizedBox(
                  width: 125,
                  height: double.maxFinite,
                  child: ListView.builder(
                    itemCount: citiesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                  // developer.log(
                                  //     name: 'selectedIndex',
                                  //     selectedIndex.toString());
                                });
                              },
                              child: AnimatedContainer(
                                width: selectedIndex == index
                                    ? imageSize + 15
                                    : imageSize,
                                height: selectedIndex == index
                                    ? imageSize + 15
                                    : imageSize,
                                duration: const Duration(milliseconds: 300),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Colors.white, width: 4),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(citiesList[index].image),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              //City Name
              Positioned(
                top: phoneSize.height / 2.65,
                left: phoneSize.width / 8,
                child: Column(
                  children: [
                    Text(
                      citiesList[selectedIndex].name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.placemark_fill,
                          color: Colors.white,
                        ),
                        Text(
                          " ${citiesList[selectedIndex].location}",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
          //section 2
          Expanded(
            child: Stack(children: [
              //Boxes
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const SizedBox.shrink(),
                  //Distance Box
                  Container(
                    width: phoneSize.height / 11,
                    height: phoneSize.height / 11,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(12, 73, 70, 70)),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Distance",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Text(
                          "${citiesList[selectedIndex].distance} Km",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 96, 171, 232),
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  //Temp Box
                  Container(
                    width: phoneSize.height / 11,
                    height: phoneSize.height / 11,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(12, 73, 70, 70)),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Temp",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Text(
                          "${citiesList[selectedIndex].temp}° C",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 96, 171, 232),
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  //Rating Box
                  Container(
                    width: phoneSize.height / 11,
                    height: phoneSize.height / 11,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(12, 73, 70, 70)),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Distance",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Text(
                          citiesList[selectedIndex].rating,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 96, 171, 232),
                              fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  const SizedBox.shrink()
                ],
              ),
              //Description
              Positioned(
                bottom: phoneSize.height / 7,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        citiesList[selectedIndex].description,
                        style: const TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    ));
  }
}
