import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_app/Models/CityModels.dart';

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
        Locale('fa'), // Farsi
      ],
      theme: ThemeData(
          fontFamily: 'iransans',
          textTheme: const TextTheme(
              headline1: TextStyle(color: Colors.black),
              headline2: TextStyle(color: Colors.amber))),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    int selectedIndex = 0;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: phoneSize.height / 1.8,
            child: Stack(children: [
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
                        CupertinoIcons.heart,
                        color: Colors.black,
                      ),
                    ),
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
                    )
                  ],
                ),
              )
            ]),
          ),
          Expanded(
            child: Container(
              color: Colors.red,
              width: double.infinity,
            ),
          ),
        ],
      ),
    ));
  }
}
