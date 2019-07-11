import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'adddata.dart';
import 'detail.dart';
import 'editdata.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    routes: <String, WidgetBuilder> {
    '/home': (BuildContext context) => new HomePage(),
    '/adddata' : (BuildContext context) => new AddData(),
    '/editdata' : (BuildContext context) => new EditData(),

    }
  ));
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Future<List> getData() async {
    final response =
        await http.get("http://databaseron.000webhostapp.com/getdata.php");

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Vez')),
        backgroundColor: Colors.green,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => AddData(),
        )),
        child: Icon(Icons.add),

      ),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) => Detail(list: list, index: index,))),
          child: Card(
            child: ListTile(
              title: Text(
                list[index]['busName'],
                style: TextStyle(fontSize: 18.0)
              ),
              subtitle: Text(
                  "${list[index]['busNumber']} \n${list[index]['busLoc']}",style: TextStyle(fontSize: 18.0)),
              trailing: Text(list[index]['busTime'],style: TextStyle(fontSize: 18.0)),
              
            ),
          ),
        );
      },
    );
  }
}
