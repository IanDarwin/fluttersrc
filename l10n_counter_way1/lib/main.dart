import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // Uncomment this line to hard-force a given Locale
      // locale: Locale('es', ''),
      localizationsDelegates: const [
        MyLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English
        Locale('es', ''), // Spanish
        Locale('ar', ''), // Arabic
        Locale('ua', ''), // Ukraine
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: MyLocalizations.of(context, 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              MyLocalizations.of(context, 'You have pushed the button this many times:'),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MyLocalizations {
  MyLocalizations(this.locale);

  final Locale locale;

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'Flutter Demo Home Page': 'Flutter Demo Home Page',
      'You have pushed the button this many times:': 'You have pushed the button this many times:',
    },
    'ar': {
      'Flutter Demo Home Page': 'فو',
      'You have pushed the button this many times:': 'لقد ضغطت على الزر عدة مرات',
    },
    'es': {
      'Flutter Demo Home Page': 'Demo de Flutter',
      'You have pushed the button this many times:': 'Has pulsado el botón tantas veces:',
    },
    'ua': {
      'Flutter Demo Home Page': 'Flutter Demo Home Page',
      'You have pushed the button this many times:': 'Ви натискали кнопку так багато разів:',
    },
  };

  String translate(key) {
    return _localizedValues[locale.languageCode]![key]!;
  }

  static String of(BuildContext context, String key) {
    var loc = Localizations.of<MyLocalizations>(context, MyLocalizations);
    if (loc == null) {
      return key;
    }
    return loc!.translate(key);
  }
}

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {

  const MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es', 'ar', 'ua'].contains(locale.languageCode);

  @override
  Future<MyLocalizations> load(Locale locale) {
    return SynchronousFuture<MyLocalizations>
      (MyLocalizations(locale));
  }

  @override
  bool shouldReload(MyLocalizationsDelegate old) => false;
}
