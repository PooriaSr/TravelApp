import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/Models/CityModels.dart';
import 'package:expandable/expandable.dart';

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
  List liked = [];
  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    double imageSize = 75;
    for (int i = 0; i < citiesList.length; i++) {
      liked.add(citiesList[i].liked);
    }
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
        physics: const BouncingScrollPhysics(),
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
                            if (liked[selectedIndex] == false) {
                              liked[selectedIndex] = true;
                            } else {
                              liked[selectedIndex] = false;
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
                          child: liked[selectedIndex] == false
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
                                          image: AssetImage(
                                              citiesList[index].image),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Distance Card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(width: 0.1, color: Colors.black)),
                  child: SizedBox(
                    width: 85,
                    height: 85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Distance",
                          style: TextStyle(fontSize: 12),
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
                ),
                //Temp Card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(width: 0.1, color: Colors.black)),
                  child: SizedBox(
                    width: 85,
                    height: 85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Temp",
                          style: TextStyle(fontSize: 12),
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
                ),
                //Rating Card
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(width: 0.1, color: Colors.black)),
                  child: SizedBox(
                    width: 85,
                    height: 85,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Rating",
                          style: TextStyle(fontSize: 12),
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
                ),
              ],
            ),
            //Description
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(maxHeight: double.infinity),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                child: ExpandablePanel(
                    header: const Text("Description"),
                    expanded: Text(
                      citiesList[selectedIndex].description,
                      softWrap: true,
                    ),
                    collapsed: Text(
                      citiesList[selectedIndex].description,
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    theme: const ExpandableThemeData(
                      animationDuration: Duration(milliseconds: 500),
                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                      iconColor: Color.fromARGB(255, 26, 19, 59),
                      iconPlacement: ExpandablePanelIconPlacement.right,
                    )),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
