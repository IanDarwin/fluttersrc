
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

void main() => runApp(const MyApp());

final _random = Random();
const int maxImages = 150;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MainScreen(),
    );
  }
}

/// The PicSum API lets you get a random image, but we pick a random
/// number for it and fetch that, so we can fetch the details without
/// having to use the http api just to get the picture.
class MainScreen extends StatefulWidget {

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int id = _random.nextInt(maxImages);
  MainScreenState();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo: Random Picture'),
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
                        id = _random.nextInt(maxImages);
                      });
                    },
                    child: const Text('Another')),
                ElevatedButton(
                    onPressed: () async {
                      var url = Uri.parse('https://picsum.photos/id/$id/info');
                      var response = await http.get(url);
                      var message = "";
                      if (response.statusCode == 200) {
                        var json = jsonDecode(response.body);
                        message =
"""Photographer: ${json['author']}
Origin: ${json['url']}
PicSum ID: ${json['id']}
 """;
                      } else {
                        message = "HTTP error ${response.statusCode}";
                      }
                      showDialog<void>(
                          context: context,
                          barrierDismissible: true, // must tap a button to dismiss
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Details"),
                              content: Text(message),
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
