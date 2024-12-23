import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visitor_app/pages/viewallvisitor.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Admin Dashboard"),
        ),
        body: Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent
              ),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=>Viewallvisitor()),
                );
              },
              child: Text("View all Visitor Details",
              ),
            ),
            ),
        );
    }
}