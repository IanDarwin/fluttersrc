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

class Datum {
	final String name;
	final Object value;
	final String explanation;
	const Datum(this.name, this.value, this.explanation);
}
Directory root = Directory("NOT_AVAILABLE");
List<Directory> roots = List.of(root as Iterable<Directory>);
getData() async {
  return [
	Datum("applicationCacheDirectory", await getApplicationCacheDirectory(),
		"directory where the application may place application-specific cache files."),
	Datum("applicationDocumentsDirectory", await getApplicationDocumentsDirectory(),
		"directory where the application may place data that is user-generated, or that cannot otherwise be recreated by your application."),
	Datum("applicationSupportDirectory", await getApplicationSupportDirectory(),
		"directory where the application may place application support files."),
	Datum("downloadsDirectory", await getDownloadsDirectory()??root,
		"directory where downloaded files can be stored."),
	Datum("externalCacheDirectories", await getExternalCacheDirectories()??roots,
		"directories where application specific cache data can be stored externally."),
	// Datum("externalStorageDirectories", await getStorageDirectory(),
	// 	"directories where application specific data can be stored externally."),
	Datum("externalStorageDirectory", await getExternalStorageDirectory()??root,
		"directory where the application may access top level storage."),
	Datum("libraryDirectory", await getLibraryDirectory(),
		"directory where application can store files that are persistent, backed up, and not visible to the user, such as sqlite.db."),
	Datum("temporaryDirectory", await getTemporaryDirectory(),
		"temporary directory on the device that is not backed up and is suitable for storing caches of downloaded files."),
  ];
}

class PathProviderDemoState extends State<PathProviderDemo> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (Datum d in getData()) {
      list.add(GestureDetector(
        onTap: () => alert(context, d.explanation, title: "Details"),
        child: Text(
          "${d.name}, ${d.value}",
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
}
