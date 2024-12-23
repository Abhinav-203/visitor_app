import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_app/pages/addvisitor.dart';
import 'package:visitor_app/pages/viewallvisitor.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  int selectedIndex=0;

  final List<Widget>pages=[
    AddVisitor(),
    Viewallvisitor(),
  ];

  void onItemTapped(int index){
    setState(() {
      selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Security Dashboard"),
        ),
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.add),
                  label: "Add Visitor"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: "View Visitors"),
            ],
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            ),
        );
    }
}