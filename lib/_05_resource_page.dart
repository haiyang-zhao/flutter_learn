import 'dart:ui';

import 'package:flutter/material.dart';

class ResourcePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ResourcePage usage',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("ResourcePage"),
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
                child: Image(
                  image: AssetImage('images/image.png'),
                ))));
  }
}
