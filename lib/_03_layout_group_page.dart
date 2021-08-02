import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({Key? key}) : super(key: key);

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  // This widget is the root of your application.
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Layout usage',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Layout usage"),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Text('Click!'),
          ),
          body: Container(
            alignment: Alignment.center,
            color: Colors.blueGrey,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.network(
                          'https://www.devio.org/img/avatar.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      //round corner
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Opacity(
                            opacity: 0.5,
                            child: Image.network(
                              'https://www.devio.org/img/avatar.png',
                              width: 100,
                              height: 100,
                            ),
                          )),
                    )
                  ],
                ),
                Container(
                  height: 100,
                  margin: EdgeInsets.all(10),
                  child: PhysicalModel(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    clipBehavior: Clip.antiAlias,
                    child: PageView(
                      children: [
                        _item('Page 1', Colors.red),
                        _item('Page 2', Colors.green),
                        _item('Page 3', Colors.blue),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.greenAccent),
                        child: Text('宽度撑满'),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Image.network(
                      'https://www.devio.org/img/avatar.png',
                      width: 100,
                      height: 100,
                    ),
                    Positioned(
                        left: -10,
                        bottom: -10,
                        child: Image.network(
                          'https://www.devio.org/img/avatar.png',
                          width: 100,
                          height: 100,
                        ))
                  ],
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 5,
                  children: [
                    _chip('Flutter'),
                    _chip('进阶'),
                    _chip('入门'),
                    _chip('高级'),
                    _chip('骨灰'),
                  ],
                ),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(color: Colors.red),
                  child: Text('高度占满剩余'),
                ))
              ],
            ),
          ),
        ));
  }

  _item(String title, Color color) {
    return Container(
      color: color,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.black),
      ),
    );
  }

  _chip(String title) {
    return Chip(
      label: Text(title),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          title.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
