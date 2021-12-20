// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedCurvedNavigationBar(),
    );
  }
}

class AnimatedCurvedNavigationBar extends StatefulWidget {
  const AnimatedCurvedNavigationBar({Key? key}) : super(key: key);

  @override
  _AnimatedCurvedNavigationBarState createState() =>
      _AnimatedCurvedNavigationBarState();
}

//$$$$$$$$$$$$$$$$$$$$$$$$$
//** Instagram :
//  ** @CodeWithFlexz
// ----------------
//** Github :
//  ** AmirBayat0
// ----------------
//** Youtube :
//  ** Programming with Flexz
//$$$$$$$$$$$$$$$$$$$$$$$$$

class _AnimatedCurvedNavigationBarState
    extends State<AnimatedCurvedNavigationBar> {
  final items = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
    Icon(Icons.search_rounded, size: 30),
    Icon(Icons.person, size: 30)
  ];
  final itemsName = [
    "Add",
    "List",
    "Compare",
    "Search",
    "account",
  ];
  int index = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue[300],
        appBar: AppBar(
          title: TweenAnimationBuilder(
            child: Column(
              children: [
                Text("@CodeWithFlexz"),
                Text(
                  "AmirHossein",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(milliseconds: 500),
            curve: Curves.bounceIn,
            builder: (BuildContext context, double _value, child) {
              return Opacity(
                opacity: _value,
                child: child,
              );
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: TweenAnimationBuilder(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$index",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 150,
                      color: Colors.white),
                ),
                Text(
                  itemsName[index],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.blue[800]),
                ),
              ],
            ),
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(milliseconds: 2000),
            builder: (BuildContext context, double _value, child) {
              return Opacity(
                opacity: _value,
                child: Padding(
                  padding: EdgeInsets.only(bottom: _value * 50),
                  child: child,
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          items: items,
          animationDuration: Duration(milliseconds: 300),
          color: Color(0xffededed),
          height: 55,
          index: index,
          onTap: (index) => setState(() {
            this.index = index;
          }),
        ),
      ),
    );
  }
}
