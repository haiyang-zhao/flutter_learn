import 'package:flutter/material.dart';

class StatelessPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StatelessWidget usage',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("StatelessWidget"),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),

          body: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.red),
              child: Column(
                children: <Widget>[
                  Text(
                    'I am Text',
                    style: TextStyle(fontSize: 20),
                  ),
                  Icon(
                    Icons.android,
                    size: 50,
                    color: Colors.green,
                  ),
                  CloseButton(),
                  BackButton(),
                  Chip(avatar: Icon(Icons.photo), label: Text('Chip Widget')),
                  Divider(
                    height: 10,
                    indent: 10,
                    color: Colors.blue,
                  ),
                  Card(
                    color: Colors.blue,
                    elevation: 5, // 阴影
                    margin: EdgeInsets.all(10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Card Text',
                        style: TextStyle(fontSize: 30, color: Colors.amber),
                      ),
                    ),
                  ),
                  AlertDialog(
                    title: Text('are you sure?'),
                    content: Text('yes'),
                  )
                ],
              )),
        ));
  }
}
