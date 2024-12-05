import 'package:flutter/material.dart';

class TabsDemo extends StatefulWidget {
  const TabsDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsDemoState();
  }
}

late TabController tc;

class _TabsDemoState extends State<TabsDemo> with SingleTickerProviderStateMixin {

  final Key key = GlobalKey();

  final tabs = [
    const Tab(text: "Departure", icon: Icon(Icons.airplane_ticket_outlined)),
    const Tab(text: "Arrival",   icon: Icon(Icons.airplanemode_active)),
    const Tab(text: "Setup",     icon: Icon(Icons.settings)),
  ];
  // N.B. Keep these parallel arrays in sync!
  final tabHandlers = <StatefulWidget> [
    _DepartureTab(key: UniqueKey()),
    _ArrivalTab(key: UniqueKey()),
    _SetupTab(key: UniqueKey()),
  ];

  @override
  void initState() {
    super.initState();
    tc = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabs Demo'),
        bottom: TabBar(
          controller: tc,
          tabs: tabs,
        ),
      ),
      body:TabBarView(
        controller: tc,
        children: tabHandlers,
      ),
    );
  }
}

class _ArrivalTab extends StatefulWidget {
  const _ArrivalTab({required super.key});

  @override
  _ArrivalTabState createState() => _ArrivalTabState();
}

class _ArrivalTabState extends State<_ArrivalTab> {
  _ArrivalTabState();

  @override
  Widget build(BuildContext context) {
    debugPrint("_ArrivalStateTab building $this");
    return const Center(child: Text("You are here!"));
  }
}

class _DepartureTab extends StatefulWidget {
  const _DepartureTab({required super.key});

  @override
  _DepartureTabState createState() => _DepartureTabState();
}

class _DepartureTabState extends State<_DepartureTab> {
  _DepartureTabState();

  @override
  Widget build(BuildContext context) {
    debugPrint("_ArrivalStateTab building $this");
    return const Center(child: Text("Have a nice trip!"));
  }
}

class _SetupTab extends StatefulWidget {
  const _SetupTab({required super.key});
  @override
  _SetupTabState createState() => _SetupTabState();
}

class _SetupTabState extends State<_SetupTab>{
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Setting up now"));
  }
}