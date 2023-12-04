import 'package:flutter/material.dart';
import 'package:oks/contants.dart';
import 'package:oks/views/home_view.dart';
import 'package:oks/views/issue_histroy_view.dart';
import 'package:oks/views/report_issue_view.dart';

import 'edit_profile_view.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var currentIndex = 0;
  final screens = [
    HomeView(),
    Center(
      child: Text(
        'Notifications',
        style: TextStyle(fontSize: 60),
      ),
    ),
    Center(
      child: Text(
        'Bills',
        style: TextStyle(fontSize: 60),
      ),
    ),
    IssueHistoryView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: White,
        title: Text(
          'My Community',
          style: TextStyle(color: Black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Black,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditProfileView()));
                },
              )),
        ],
      ),
      body: screens[currentIndex],
      bottomNavigationBar: buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReportIssueView()));
        },
        child: const Icon(
          Icons.edit,
          color: White,
        ),
        backgroundColor: Black,
      ),
    );
  }

  Widget buildBottomNav() {
    return BottomNavigationBar(
      backgroundColor: White,
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Black,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications_none_outlined,
            color: Gray,
          ),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.payments_outlined,
            color: Gray,
          ),
          label: 'Bills',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.history,
            color: Gray,
          ),
          label: 'Issues log',
        ),
      ],
    );
  }
}
