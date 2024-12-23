import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddVisitor extends StatelessWidget {
  AddVisitor({super.key});

  TextEditingController fname=TextEditingController();
  TextEditingController lname=TextEditingController();
  TextEditingController purpose=TextEditingController();
  TextEditingController whomtomeet=TextEditingController();

  Future<void> sendData() async{
    final apiUrl=
    Uri.parse("https://log-app-demo-api.onrender.com/addvisitor");

    try{
      final response=await http.post(
        apiUrl,
        headers: {'Content-Type':'application/json',
        },
        body: jsonEncode({
          "firstname":fname.text,
          "lastname":lname.text,
          "purpose":purpose.text,
          "whomtomeet":whomtomeet.text
        }),
      );
      if(response.statusCode==200){
        print("Successfully Added");
      }
      else{
        print("Something Went Wrong");
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              TextField(
                controller: fname,
                decoration: InputDecoration(
                    labelText:"First name",
                    hintText: "Enter first name",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: lname,
                decoration: InputDecoration(
                    labelText: "Last name",
                    hintText: "Enter last name",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: purpose,
                decoration: InputDecoration(
                    labelText:"Purpose",
                    hintText: "Enter purpose",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: whomtomeet,
                decoration: InputDecoration(
                    labelText: "WhomToMeet",
                    hintText: "Enter whom to meet",
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero
                        ),
                        backgroundColor: Colors.green
                    ),
                    onPressed: () async{
                      await sendData();
                    },
                    child: Text("Submit",
                      style: TextStyle(color: Colors.white,
                          fontSize: 20.0),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}