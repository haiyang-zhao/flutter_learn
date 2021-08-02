import 'package:flutter/material.dart';
import 'package:flutter_learn/_01_stateless_group_page.dart';
import 'package:flutter_learn/_02_stateful_group_page.dart';
import 'package:flutter_learn/_03_layout_group_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learn',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('使用Flutter导航'),
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
        body: RouteNavigator(title: 'Flutter Learn Home Page'),
      ),
      routes: {
        'stateless': (BuildContext context) => StatelessPage(),
        'statefull': (BuildContext context) => StatefulPage(),
        'layout': (BuildContext context) => LayoutPage(),
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  RouteNavigator({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool _byName = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          SwitchListTile(
              title: Text("${_byName ? '' : '不'}通过路由名跳转"),
              value: _byName,
              onChanged: (value) {
                setState(() {
                  _byName = value;
                });
              }),
          _item('StatelessWidget组件', StatelessPage(), 'stateless'),
          _item('StatefulWidget组件', StatefulPage(), 'statefull'),
          _item('Layout组件', LayoutPage(), 'layout'),
        ],
      ),
    );
  }

  _item(String title, Widget page, String routeName) {
    return Container(
      child: ElevatedButton(
        child: Text(title),
        onPressed: () {
          if (_byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => page));
          }
        },
      ),
    );
  }
}
