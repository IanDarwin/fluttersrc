import 'package:flutter/material.dart';

/// PageRouteBuilder to use FadeTransition between pages
// Lifted from
// https://medium.com/better-programming/how-to-use-mvvm-in-flutter-4b28b63da2ca
class FadeInRoute extends PageRouteBuilder {
  final Widget page;
  FadeInRoute({required this.page}) : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) => page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) => FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}
