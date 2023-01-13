import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const MyApp());

final _random = Random();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: Center(
        child:  ElevatedButton(
          child: const Text('Random Image'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailsScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {

  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  int id = _random.nextInt(100);
  DetailsScreenState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Column(children: [
        Center(
          child: Image.network(
            'https://picsum.photos/id/$id/600/450',
          ),
        ),
        Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: ()  {
                      setState(() {
                        id = _random.nextInt(100);
                      });
                    },
                    child: const Text('Another')),
                ElevatedButton(
                    onPressed: ()  {
                      showDialog<void>(
                          context: context,
                          barrierDismissible: true, // must tap a button to dismiss
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Details"),
                              content: const Text("Details code not written yet, sorry"),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            );
                          }
                      );
                    },
                    child: const Text('Details')),
              ]),
        ),
      ],
      ),
    );
  }
}
