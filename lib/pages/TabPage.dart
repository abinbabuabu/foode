import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodie/pages/AccountPage.dart';
import 'package:foodie/pages/DetailsPage.dart';
import 'package:foodie/pages/SubscriptionDetailsPage.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    DetailsPage(),
    AccountPage(),
  ];

  void _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Subscribe")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text("Account"))
        ],
      ),
    );
  }
}
