import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'adddata.dart';
import 'detail.dart';
import 'editdata.dart';
import 'main.dart';

class Detail extends StatefulWidget {
  final List list;
  final int index;
  Detail({this.list, this.index});

  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {

  void deletedata(){
    var url = "http://databaseron.000webhostapp.com/deletedata.php";
    http.post(url,body: {
        "busId": widget.list[widget.index]['busId'],
    });
  }

  void confirm(){
    AlertDialog alertdialog = new AlertDialog(
      content: Text("Are you sure you want to Delete ${widget.list[widget.index]['busName']} ?"),
      actions: <Widget>[
          RaisedButton(
            child: Text("Yes",style: TextStyle(color: Colors.white),),
            color: Colors.red,
            onPressed: (){
              deletedata();
              //Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => HomePage()));
              //Navigator.popAndPushNamed(context, '/home');
              Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
              
            }),
            RaisedButton(
            child: Text("No",style: TextStyle(color: Colors.white)),
            color: Colors.green,
            onPressed: ()=> Navigator.pop(context),)
      ],
    );
    showDialog(context: context, child: alertdialog);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['busName']}"),
      ),
      body: Container(
        height: 250.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Text(
                  widget.list[widget.index]['busName'],
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  widget.list[widget.index]['busNumber'],
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  widget.list[widget.index]['busTime'],
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                  widget.list[widget.index]['busLoc'],
                  style: TextStyle(fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => EditData(list: widget.list,index: widget.index,),
                      )),
                      child: Text("Edit"),
                      color: Colors.green,
                    ),
                    RaisedButton(
                      onPressed: ()=> confirm() ,
                      child: Text("Delete"),
                      color: Colors.red,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
