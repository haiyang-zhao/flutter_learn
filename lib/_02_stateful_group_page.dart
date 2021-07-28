import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({Key? key}) : super(key: key);

  @override
  _StatefulPageState createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> {
  // This widget is the root of your application.
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var container = Container(
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
        ));
    return MaterialApp(
        title: 'StatefulWidget usage',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("StatefulWidget"),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.green,
                  )),
              BottomNavigationBarItem(
                  label: 'List',
                  icon: Icon(
                    Icons.list,
                    color: Colors.blue,
                  ),
                  activeIcon: Icon(
                    Icons.list,
                    color: Colors.green,
                  ))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            child: Text('Click!'),
          ),
          body: _currentIndex == 0
              ? RefreshIndicator(
                  child: ListView(
                    children: [container],
                  ),
                  onRefresh: _onRefresh)
              : Container(
                  alignment: Alignment.center,
                  color: Colors.blueGrey,
                  child: Column(
                    children: [
                      Text('List'),
                      Image.network(
                        'https://qzonestyle.gtimg.cn/qz-proj/wy-pc-v3/static/img/web/logo@2x.png',
                        width: 80,
                        height: 50,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            hintText: 'Input text',
                            hintStyle: TextStyle(color: Colors.red)),
                      ),
                      Container(
                        height: 100,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(color: Colors.red),
                        child: PageView(
                          children: [
                            _item('Page 1', Colors.red),
                            _item('Page 2', Colors.green),
                            _item('Page 3', Colors.blue),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: color),
      ),
    );
  }
}
