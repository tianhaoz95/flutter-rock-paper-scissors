import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Rock Paper Scissors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  int _playIndex = 0;
  final List<BottomNavigationBarItem> navItemList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.casino, color: Colors.white),
      title: Text('Rock!', style: TextStyle(color: Colors.white)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.casino, color: Colors.white),
      title: Text('Paper!', style: TextStyle(color: Colors.white)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.casino, color: Colors.white),
      title: Text('Scissor!', style: TextStyle(color: Colors.white)),
    )
  ];
  static const List<MaterialColor> colors = [
    Colors.cyan,
    Colors.blue,
    Colors.teal
  ];
  static const List<Text> playList = [
    Text('Rock!'),
    Text('Paper!'),
    Text('Scissor!'),
  ];
  final randGen = Random.secure();

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _playIndex = randGen.nextInt(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock Paper Scissors'),
        backgroundColor: colors[_currentIndex],
      ),
      backgroundColor: colors[_currentIndex][100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            playList[_playIndex],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colors[_currentIndex],
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: navItemList,
      ),
    );
  }
}
