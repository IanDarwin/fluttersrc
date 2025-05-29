import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'dialog_demos.dart' show alert;

class PathProviderDemo extends StatefulWidget {
  const PathProviderDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return PathProviderDemoState();
  }
}

const notSupported = "NOT AVAILABLE ON THIS PLATFORM";

class PathProviderDemoState extends State<PathProviderDemo> {
  List<Widget> list = [];

  @override
  void initState() {
    // print("initState");
    fillItIn();
    super.initState();
  }

  void fillItIn() async {
    // print("fillItIn");
    await getData(context, list);
    // print("fillItIn: getData left us with $list");
  }

  @override
  Widget build(BuildContext context) {
    print("List has ${list.length} tiles");
    return ListView(
      children: list,
    );
  }

  Widget _makeEntry(String name, Object value, String explanation) {
    return ListTile(
      onTap: () => alert(context, explanation, title: "Details"),
      title: Text("$name:"),
      subtitle: Text("$value"),
      tileColor: notSupported == value ? Colors.red :
        list.length % 2 == 0 ? Colors.orangeAccent : Colors.greenAccent,
    );
  }

  Future<bool> getData(BuildContext context, List list) async {
    list.add(_makeEntry("applicationCacheDirectory", await getApplicationCacheDirectory(),
        "directory where the application may place application-specific cache files."));
    list.add(_makeEntry("applicationDocumentsDirectory", await getApplicationDocumentsDirectory(),
        "directory where the application may place data that is user-generated, or that cannot otherwise be recreated by your application."));
    list.add(_makeEntry("applicationSupportDirectory", await getApplicationSupportDirectory(),
        "directory where the application may place application support files."));
    list.add(_makeEntry("downloadsDirectory", await getDownloadsDirectory()??notSupported,
        "directory where downloaded files can be stored."));
    list.add(_makeEntry("externalCacheDirectories", await getExternalCacheDirectories()??notSupported,
      "directories where application specific cache data can be stored externally."));
    list.add(_makeEntry("externalStorageDirectory", await getExternalStorageDirectory()??notSupported,
        "directory where the application may access top level storage."));
    list.add(_makeEntry("libraryDirectory", Platform.isAndroid?notSupported:await getLibraryDirectory(),
        "directory where application can store files that are persistent, backed up, and not visible to the user, such as sqlite.db."));
    list.add(_makeEntry("temporaryDirectory", await getTemporaryDirectory(),
        "temporary directory on the device that is not backed up and is suitable for storing caches of downloaded files."));
    return true;
  }
}

