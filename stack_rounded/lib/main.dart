import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  // Obligatory license publication for Google Fonts
  // LicenseRegistry.addLicense(() async* {
  //   final license = await rootBundle.loadString('google_fonts/OFL.txt');
  //   yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  // });

  // Obligatory runApp call.
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

  static const borderRadiusTop = BorderRadius.only(
      topLeft: Radius.circular(32.0), topRight: Radius.circular(32.0));
  static const borderRadiusDropLeft = BorderRadius.only(
      topLeft: Radius.circular(32.0), bottomRight: Radius.circular(32.0));
  static const borderRadiusDropRight = BorderRadius.only(
      topRight: Radius.circular(32.0), bottomLeft: Radius.circular(32.0));

  void doSomethingAndRedisplay() {
    setState(() {
      //
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
          // Some text above the avatar
          Container(
            height: mq.size.height * 1.0/5.0,
            width: mq.size.width,
            decoration: const BoxDecoration(
              color:Color(0xffffffff),
            ),
            child:const Center(child:
            Text("Flutter Makes Nice Apps!",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black))),
          ),

          // Large blue box with rounded top
          Container(
            margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            padding: const EdgeInsets.all(0),
            height:mq.size.height,
            width: mq.size.width,
            decoration: BoxDecoration(
              color:const Color(0xff0000ff),
              shape:BoxShape.rectangle,
              borderRadius:borderRadiusTop,
              border:Border.all(color:Color(0x4d9e9e9e),width:1),
            ),
          ),

          // Dark box with opposite-rounded corners
          Container(
            margin: const EdgeInsets.fromLTRB(50, 300, 0, 0),
            padding: const EdgeInsets.all(0),
            height: 200,
            width:  200,
            decoration: BoxDecoration(
              color:const Color(0xff000000),
              shape:BoxShape.rectangle,
              borderRadius: borderRadiusDropLeft,
              border:Border.all(color:Color(0x4d9e9e9e),width:1),
            ),
            child: Image.asset("images/lion-in-the-sand.png",
                width: 200.0, height: 200.0,
            ),
          ),

          // Medium off-white box with opposite-rounded corners
          Container(
            margin: const EdgeInsets.fromLTRB(150, 420, 0, 0),
            padding: const EdgeInsets.all(0),
            height: 200,
            width:  200,
            decoration: BoxDecoration(
              color:const Color(0xc0f0f0f0),
              shape:BoxShape.rectangle,
              borderRadius: borderRadiusDropRight,
              border:Border.all(color:Color(0x4d9e9e9e),width:1),
            ),
            child: Center(child: Text("Lion in the sand",
                style: GoogleFonts.explora(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 46,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Colors.black))
            ),
          ),

          // The avatar
          Container(
            margin: const EdgeInsets.fromLTRB(0, 150-50, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:const [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://www.gravatar.com/avatar/093d7a59c573047572c112bf79c83066'),
                )],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("FAB Pressed"),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
