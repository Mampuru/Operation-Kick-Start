import 'package:flutter/material.dart';
import 'package:oks/contants.dart';
import 'package:oks/views/home_view.dart';
import 'package:oks/views/issue_histroy_view.dart';
import 'package:oks/views/report_issue_view.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var currentIndex = 0;
  final screens = [
    HomeView(),
    Center(child: Text('Notifications',style: TextStyle(fontSize: 60),),),
    Center(child: Text('Bills',style: TextStyle(fontSize: 60),),),
    IssueHistoryView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PrimaryColor,
        leading: Icon(Icons.account_circle,size:30,color: Colors.white,),
        title: Text('My Community'),
        centerTitle: true,
      ),
      body: screens[currentIndex],
      bottomNavigationBar: buildBottomNav(),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ReportIssueView()));
        },
        child: const Icon(Icons.edit,color: White,),
        backgroundColor: Black,
      ),
    );
  }

  Widget buildBottomNav(){
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => setState(() => currentIndex = index),
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

