import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'adddata.dart';
import 'detail.dart';
import 'main.dart';

class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list,this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  

  TextEditingController controllerName;
  TextEditingController controllerNumber;
  TextEditingController controllerTime;
  TextEditingController controllerLocation;

  void editData(){

     var url = "http://databaseron.000webhostapp.com/editdata.php";

     http.post(url,body: {
        "busId": widget.list[widget.index]['busId'],
        "busName": controllerName.text,
        "busNumber": controllerNumber.text,
        "busTime": controllerTime.text,
        "busLocation": controllerLocation.text
      });


  }

  @override
  void initState() {
    controllerName = new TextEditingController(text: widget.list[widget.index]['busName']);
    controllerNumber = new TextEditingController(text: widget.list[widget.index]['busNumber']);
    controllerTime = new TextEditingController(text: widget.list[widget.index]['busTime']);
    controllerLocation = new TextEditingController(text: widget.list[widget.index]['busLoc']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Edit Data"),),
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
                      style: TextStyle(fontSize: 8.0)
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                ),
                RaisedButton(
                  child: Text("UPDATE DATA"),
                  onPressed: () {
                    editData();
                    
                     Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
                    
                    
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