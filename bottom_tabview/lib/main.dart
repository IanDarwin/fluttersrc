import 'package:flutter/material.dart';

void main() => runApp(
    const MyHomePage()
);

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  final _widgetOptions = [
    const Text('Index 0: Home'),
    const Text('Index 1: Business'),
    const Text('Index 2: School'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BottomNavigationBar Sample'),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.train), label: 'Arrival'),
            BottomNavigationBarItem(icon: Icon(Icons.computer), label: 'Setup'),
            BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Students'),
            BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Contact'),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.deepPurple,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}