import 'package:flutter/material.dart';

/// Show a simple AlertDialog, with default or provided actions.
alert(BuildContext context, String message, {title = 'Error', actions}) {
  debugPrint("alert('$message')");
  showDialog<void>(
      context: context,
      barrierDismissible: true, // must tap a button to dismiss
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: actions ?? <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      }
  );
}


