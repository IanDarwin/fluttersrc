import 'package:flowcase/canvas.dart';
import 'package:flowcase/drag_drop.dart';
import 'package:flowcase/layout_demos.dart';
import 'package:flowcase/login_screen.dart';
import 'package:flowcase/nav_drawer.dart';
import 'package:flowcase/nav_drawer.dart';
import 'package:flowcase/stack_rounded.dart';
import 'package:flowcase/tab_demo.dart';
import 'package:flowcase/text_demos.dart';
import 'package:flowcase/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'about.dart';
import 'animation_demo.dart';
import 'button_demos.dart';
import 'card_demos.dart';
import 'dialog_demos.dart';
import 'fade_in_route.dart';
import 'list_demos.dart';
import 'list_tile_demo.dart';
import 'path_provider_demo.dart';
import 'table_demo.dart';

void main() async {
  Settings.init();
  runApp(const MyApp());
}

const Color gradientStartColor = Color(0xff0057b7);
const Color gradientEndColor = Colors.redAccent;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of this application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlowCase',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.lightGreen,
      ),
      home: const MyHomePage(title: 'FlowCase: Demo Flutter Demo'),
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
  @override
  Widget build(BuildContext context) {
    var shape = MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => alert(context, "Search disabled", title: "Sorry"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
        ],
      ),
      drawer: const NavDrawer(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.7],
          ),
        ),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          children: [
            // Most of these use our own Wrapper but a few do not; edit w/ care.
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Button Demo"),
              onPressed: () {
                Navigator.push(context, FadeInRoute(
                    page: const Wrapper('Push My Buttons', ButtonDemos(), "button_demos",)));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Card Demo"), onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const Wrapper('Cards', CardDemos(), 'card_demos')));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Dialog Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    const Wrapper('Dialog', DialogDemos(), "dialog_demos")));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Drag-n-Drop Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    const Wrapper('Shop til you drop', DragDropDemo(), "drag_drop")));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Graphics Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    // Does not use Wrapper(), has own Scaffold
                    builder: (context) => const StackRounded(title: "Sandy Lion")));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Layout Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    const Wrapper('Layouts', LayoutDemos(), "layout_demos")));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("List Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
					const Wrapper('Lists', ListDemos(), "list_demos")));

              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("ListTile Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    const Wrapper('ListTile', ListTileDemos(), "list_tile_demo",)));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Login Screen Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    Wrapper('Login Screen', AuthForm(key: UniqueKey()), "login_screen")));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Path Provider Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
                    const Wrapper('PathProvider', PathProviderDemo(), "path_provider_demo",)));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("SnackBar Demo"),
              onPressed: () { // Done here in main Widget
                showUndoSnackbar(context, "Deleted Item #123", () => {});
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Table Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) =>
					const Wrapper('Tables', TableDemo(), "table_demo",)));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Tabs Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  // Does not use Wrapper(), has own Scaffold
                    builder: (context) => const TabsDemo()));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Text Demo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const Wrapper('Text', TextDemos(), "text_demos")));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Animation"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const Wrapper('Animation', AnimationApp(), "animation_demo")));
              },
            ),
            ElevatedButton(
              style: ButtonStyle(shape: shape),
              child: const Text("Canvas"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const Wrapper('Canvas', SimpleDrawWidget(), "canvas",)));
              },
            ),
            TextButton(
              child: const Text("About (Custom)",
                style: TextStyle(color: Colors.black)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const Wrapper('About Flowcase', About(), "about",)));
              },
            ),
            // For the About, some may prefer this shorter form:
            const AboutListTile(
              icon: Icon(Icons.info),
              applicationName:  'FlowCase',
              aboutBoxChildren: [
                Text("This is a pre-fab Flutter ListTile. Thank you for trying out this demo!"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

void showUndoSnackbar(BuildContext context, String message, Function undoer) {
  final snackBar = SnackBar(
    content: Text(message),
    action: SnackBarAction(
        label: "Undo",
        onPressed: () {
          debugPrint("Undoing '$message'");
          undoer();
        }
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

