import 'package:flutter/material.dart';
import 'package:oks/contants.dart';

class BottomNavBottom extends StatefulWidget {
  @override
  _BottomNavBottomState createState() => _BottomNavBottomState();
}

class _BottomNavBottomState extends State<BottomNavBottom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
          backgroundColor:PrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none_outlined),
          label: 'Notifications',
          backgroundColor:PrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payments_outlined),
          label: 'Bills',
          backgroundColor:PrimaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'Issues log',
          backgroundColor:PrimaryColor,
        ),
      ],
    );
  }
}

