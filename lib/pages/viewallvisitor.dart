import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Viewallvisitor extends StatefulWidget {
  const Viewallvisitor({super.key});

  @override
  State<Viewallvisitor> createState() => _ViewallvisitorState();
}

class _ViewallvisitorState extends State<Viewallvisitor> {
  List<Map<String,dynamic>> vistors=[];

  Future<void> fetchVisitorsData() async{
    final apiUrl=Uri.parse("https://log-app-demo-api.onrender.com/getvistors");

    try{
      final response=await http.get(apiUrl);
      if(response.statusCode==200){
        List data=json.decode(response.body);
        setState(() {
          vistors=List<Map<String,dynamic>>.from(data);
        });
        print("API called Successfully");
      }
      else{
        throw Exception("Failed to fetch API data");
      }
    }
    catch(exception){
      print(exception);
    }
  }

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchVisitorsData();
  }
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: vistors.length,
        itemBuilder: (context, index){
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text(vistors[index]["firstname"] ?? "No Firstname"),
              subtitle: Text((vistors[index]["lastname"] ?? "No Lastname")+"\n"+
                  (vistors[index]["purpose"] ?? "No Purpose")+"\n"+
                  (vistors[index]["whomtomeet"] ??"Unknown" ),
              ),
            ),
          );
          });
    }
}