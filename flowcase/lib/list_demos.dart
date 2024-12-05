import 'package:flutter/material.dart';

import 'dialog_demos.dart';

class ListDemos extends StatefulWidget {
  const ListDemos({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListDemosState();
  }
}

class Person {
  final String firstName, lastName, occupation;
  const Person(this.firstName, this.lastName, this.occupation);
}

List<Person> people = [
  const Person("Boris", "Johnson", "Ex-PM of the UK"),
  const Person("Annie", "Smith", "Unknown"),
  const Person("Robin", "Jones", "Unknown"),
  const Person("Ethiah", "Jenkins", "Shady alias"),
  const Person("J.", "Adams", "Signer of the Declaration"),
  const Person("George", "Washington", "Ex-President of the US"),
  const Person("Barack", "Obama", "Ex-President of the US"),
  const Person("Volodymyr", "Zelensky", "Actor, President of Україні"),
  const Person("Ian", "Darwin", "Jack of all trades"),
  const Person("Bill", "The Cat", "Comedian"),
  const Person("Julian", "Lightray", "Unlisted but brilliant"),
  const Person("Christopher", "Gomersall", "Photographer"),
  const Person("Donald", "Knuth", "Computer Scientist"),
  const Person("Edward", "Teller", "Physicist"),
];

class ListDemosState extends State<ListDemos> {
  Offset _pos = Offset.zero;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (Person p in people) {
      list.add(GestureDetector(
        onTapDown: (pos) {_getTapPosition(pos);},
        onTap: () => alert(context, p.occupation, title: "Details"),
        onLongPress: () async {
          final RenderObject? overlay =
            Overlay.of(context)?.context.findRenderObject();
          await showMenu(
            context: context,
            position: RelativeRect.fromRect(
                Rect.fromLTWH(_pos.dx, _pos.dy, 50, 50),
                Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                    overlay.paintBounds.size.height)),
            items: <PopupMenuEntry>[
              PopupMenuItem(
                onTap: () async => _edit(context),
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.edit),
                    Text("Edit"),
                  ],
                ),
              ),
              PopupMenuItem(
                onTap: () async => _delete(context),
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.delete),
                    Text("Delete"),
                  ],
                ),
              ),
            ],
          );
        },
        child: Text(
          "${p.lastName}, ${p.firstName}",
          style: Theme.of(context)
              .textTheme
              .headlineSmall,
        ),
      )
      );
    }
    return ListView(
      children: list,
    );
  }

  void _getTapPosition(TapDownDetails tapPosition) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    _pos = referenceBox.globalToLocal(tapPosition.globalPosition);
  }

  // The PopupMenuItem.onTap does its own Navigator.pop,
  // so we use Future.delayed() to "delay" around the pop.
  _edit(context) async {
    debugPrint("Edit");
    Future.delayed(
        const Duration(seconds: 0),
            () =>  alert(context, "Read-only, sorry", title: "Can't Edit"));
  }

  _delete(context) async {
    debugPrint("Delete");
    Future.delayed(
        const Duration(seconds: 0),
    () => alert(context, "Read-only, sorry", title: "Unable to delete"));
  }
}
