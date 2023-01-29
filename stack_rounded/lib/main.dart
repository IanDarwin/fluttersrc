import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stack Rounded Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'Stack Rounded Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: mq.size.height * 1.0/5.0,
            width: mq.size.width,
            decoration: const BoxDecoration(
              color:Color(0xffffffff),
            ),
            child:Center(child:
            Text("You snooz ya lose!",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black))),
          ),

          Container(
            margin:EdgeInsets.fromLTRB(0, 150, 0, 0),
            padding:EdgeInsets.all(0),
            height:mq.size.height,
            width: mq.size.width,
            decoration: BoxDecoration(
              color:Color(0xff0000ff),
              shape:BoxShape.rectangle,
              borderRadius:BorderRadius.only(topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0)),
              border:Border.all(color:Color(0x4d9e9e9e),width:1),
            ),
            child: Center(child:
            Text("Your name in lights!",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white))),
          ),
          Container(
            margin:EdgeInsets.fromLTRB(0, 150-50, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://www.gravatar.com/avatar/093d7a59c573047572c112bf79c83066'),
                )],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
