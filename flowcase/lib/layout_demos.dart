import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LayoutDemos extends StatefulWidget {
  const LayoutDemos({super.key});

  @override
  State<StatefulWidget> createState() {
    return LayoutState();
  }
}

class LayoutState extends State<LayoutDemos> {
  static const List<Color> colors = [ Colors.red, Colors.white, Colors.blue,
    Colors.blue, Colors.yellow, Colors.white,
    Colors.green, Colors.white10, Colors.deepOrange];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:  [
        ListTile(
          onTap: _tapped,
          tileColor: Colors.teal,
          textColor: Colors.white,
          leading: const Text("Leading"),
          title:  Text("ListTile Demo Title",
              style: Theme.of(context).textTheme.headlineSmall
          ),
          subtitle: const Text("SubTitle"),
          trailing: const Text("Trailing"),
        ),
        Card(
          child: ListTile(
            onTap: _tapped2,
            leading: const Icon(Icons.add_circle),
            title: Text("ListTile In Card Title",
                style: Theme.of(context).textTheme.headlineSmall
            ),
            subtitle: const Text("SubTitle"),
            trailing: const Text("Trailing"),
          ),
        ),
        Text("Here's a simple Container Child Text",
            style: Theme.of(context).textTheme.headlineSmall),
        Container(height: 20,),
        Text("And a Grid Layout with Text:",
            style: Theme.of(context).textTheme.headlineSmall),
        SizedBox(
          height: 400,
          child: GridView.count(
            crossAxisCount: 3,
            key: UniqueKey(),
            children: List.generate(
              3 * 3, (index) => Container(
              color: colors[index],
              child: Center(child: Text("${index+1}")),
            ),
          ),
        ),
        ),
      ],
    );
  }
}

void _tapped() {
  if (kDebugMode) {
    print("Tapped 1!");
  }
}

void _tapped2() {
  if (kDebugMode) {
    print("Tapped 2!");
  }
}
