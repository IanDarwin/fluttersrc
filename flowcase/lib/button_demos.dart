import 'package:flutter/material.dart';

class ButtonDemos extends StatefulWidget {
  const ButtonDemos({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ButtonDemosState();
  }
}

class _ButtonDemosState extends State<ButtonDemos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(80),
        child: Center(
          child: ListView(
              children:[
                // A TextButton has no border or background by default
                TextButton(
                  onPressed: () => debugPrint("TextButton pressed"),
                  child: const Text("Push me"),
                ),

                // The common MaterialButton
                ElevatedButton(
                  onPressed: () => debugPrint("ElevatedButton pressed"),
                  child: const Text("Push me"),
                ),

                Container(height:20), // Just for spacing

                // Image button isn't a class; use a button with an Image child:
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () => debugPrint("Image Button pressed"),
                  child: Image.asset("images/logo.png",
                    height:64,
                  ),
                ),

                // IconButton to use one of the pre-defined Icons
                IconButton(
                  icon: const Icon(Icons.add_a_photo_sharp),
                  onPressed: () => debugPrint("IconButton pressed"),
                ),

                DropdownButton(
                  value: "One",
                  items: const [
                    DropdownMenuItem(value: "One", child: Text("One")),
                    DropdownMenuItem(value: "Two", child: Text("Two")),
                    DropdownMenuItem(value: "Three", child: Text("Three")),
                  ],
                  onChanged: (val) => debugPrint("You selected $val"),
                ),
              ]
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("FAB pressed"),
        child: const Icon(Icons.add),
      ),
    );
  }










}
