import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        //注册首页路由
        "new_page": (context) => EchoRoute(),
        "tip_route": (context) {
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    //...省略无关代码
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text(args),
      ),
    );
  }
}

class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: Text("返回"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  ///返回一个居中带图标和文本的Item
  _getBottomItem(IconData icon, String text) {
    ///充满 Row 横向的布局
    return new Expanded(
      flex: 1,

      ///居中显示
      child: new Center(

        ///横向布局
        child: new Row(

          ///主轴居中,即是横向居中
          mainAxisAlignment: MainAxisAlignment.center,

          ///大小按照最大充满
          mainAxisSize: MainAxisSize.max,

          ///竖向也居中
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            ///一个图标，大小16.0，灰色
            new Icon(
              icon,
              size: 16.0,
              color: Colors.grey,
            ),

            ///间隔
            new Padding(padding: new EdgeInsets.only(left: 5.0)),

            ///显示文本
            new Text(
              text,
              //设置字体样式：颜色灰色，字体大小14.0
              style: new TextStyle(color: Colors.grey, fontSize: 14.0),
              //超过的省略为...显示
              overflow: TextOverflow.ellipsis,
              //最长一行
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("Open new new_page"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "new_page", arguments: "new_page");
              },
            ),
            FlatButton(
              child: Text("Open new tip_route"),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, "tip_route",
                    arguments: "tip_route");
              },
            ),
            Container(

              ///四周10大小的maring
                margin: EdgeInsets.all(10.0),
                height: 120.0,
                width: 500.0,

                ///透明黑色遮罩
                decoration: new BoxDecoration(

                  ///弧度为4.0
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),

                    ///设置了decoration的color，就不能设置Container的color。
                    color: Colors.blue,

                    ///边框x
                    border:
                    new Border.all(color: Color(0xFF42A5F5), width: 0.3)),
                child: new Text("666666")),
            Container(

              ///卡片包装
              child: new Card(

                ///增加点击效果
                  child: new FlatButton(
                      onPressed: () {
                        print("点击了哦");
                      },
                      child: new Padding(
                        padding: new EdgeInsets.only(
                            left: 0.0, top: 10.0, right: 10.0, bottom: 10.0),
                        child: new Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            ///文本描述
                            new Container(
                                child: new Text(
                                  "这是一点描述",
                                  style: TextStyle(
                                    color: Color(0xFF42A5F5),
                                    fontSize: 14.0,
                                  ),

                                  ///最长三行，超过 ... 显示
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                margin:
                                new EdgeInsets.only(top: 6.0, bottom: 2.0),
                                alignment: Alignment.topLeft),
                            new Padding(padding: EdgeInsets.all(10.0)),

                            ///三个平均分配的横向图标文字
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                _getBottomItem(Icons.star, "1000"),
                                _getBottomItem(Icons.link, "1000"),
                                _getBottomItem(Icons.subject, "1000"),
                              ],
                            ),
                          ],
                        ),
                      ))),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
