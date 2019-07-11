import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'detail.dart';
import 'main.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerNumber = new TextEditingController();
  TextEditingController controllerTime = new TextEditingController();
  TextEditingController controllerLocation = new TextEditingController();

  void addData(){
      var url = "http://databaseron.000webhostapp.com/adddata.php";

      http.post(url,body: {
        "busName": controllerName.text,
        "busNumber": controllerNumber.text,
        "busTime": controllerTime.text,
        "busLocation": controllerLocation.text
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                TextField(
                  controller: controllerName,
                  decoration: InputDecoration(
                      hintText: "Bus Name", labelText: "Bus Name"),
                ),
                TextField(
                  controller: controllerNumber,
                  decoration: InputDecoration(
                      hintText: "Bus Number", labelText: "Bus Number"),
                ),
                TextField(
                  controller: controllerTime,
                  decoration: InputDecoration(
                      hintText: "Bus Time", labelText: "Bus Time"),
                ),
                TextField(
                  controller: controllerLocation,
                  decoration: InputDecoration(
                      hintText: "Bus Location", labelText: "Bus Location"),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text("ADD DATA"),
                  onPressed: () {
                    addData();
                    Navigator.pop(context);
                  },
                  color: Colors.blueAccent,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
