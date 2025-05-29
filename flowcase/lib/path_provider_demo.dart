import 'package:flutter/material.dart';

import 'dialog_demos.dart' show alert;

class PathProvider extends StatefulWidget {
  const PathProvider({super.key});

  @override
  State<StatefulWidget> createState() {
    return PathProviderDemoState();
  }
}

class Datum {
	final String name;
	final String value;
	final String explanation;
	const Datum(this.name, this.value, this.explanation);
}

final data = [
	Datum("applicationCacheDirectory", pathProvider.getApplicationCacheDirectory(),
		"directory where the application may place application-specific cache files."),
	Datum("applicationDocumentsDirectory", pathProvider.getApplicationDocumentsDirectory(),
		"directory where the application may place data that is user-generated, or that cannot otherwise be recreated by your application."),
	Datum("applicationSupportDirectory", pathProvider.getApplicationSupportDirectory(),
		"directory where the application may place application support files."),
	Datum("downloadsDirectory", pathProvider.getDownloadsDirectory(),
		"directory where downloaded files can be stored."),
	Datum("externalCacheDirectories", pathProvider.getExternalCacheDirectories(),
		"directories where application specific cache data can be stored externally."),
	Datum("externalStorageDirectories({StorageDirectory? type})
		"directories where application specific data can be stored externally."),
	Datum("externalStorageDirectory", pathProvider.getExternalStorageDirectory(),
		"directory where the application may access top level storage."),
	Datum("libraryDirectory", pathProvider.getLibraryDirectory(),
		"directory where application can store files that are persistent, backed up, and not visible to the user, such as sqlite.db."),
	Datum("temporaryDirectory", pathProvider.getTemporaryDirectory(),
		"temporary directory on the device that is not backed up and is suitable for storing caches of downloaded files."),
];


class PathProviderDemoState extends State<PathProviderDemo> {
  Offset _pos = Offset.zero;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (Datum d in data) {
      list.add(GestureDetector(
        onTapDown: (pos) {_getTapPosition(pos);},
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

  void _getTapPosition(TapDownDetails tapPosition) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    _pos = referenceBox.globalToLocal(tapPosition.globalPosition);
  }
}
