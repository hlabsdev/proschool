// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:proschool/core/utils/colors.dart';

import 'core/utils/preference.dart';
import 'features/common/data/function_utils.dart';
import 'features/launch/pages/login/launch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await allTranslations.init();
  final _appSharedPreferences = AppSharedPreferences();
  /*runApp(
    MultiProvider(
      providers: [
        Provider.value(value: _appSharedPreferences),
        FutureProvider<ConnectionStatus>(
          create: (_) => _appSharedPreferences.getConnectionState(),
          initialData: ConnectionStatus.disconnected,
        ),
        FutureProvider<ConfigModel>(
          create: (_) => _appSharedPreferences.getApkConfig(),
          initialData: ConfigModel.create(
              slogan1: allTranslations.text('slogant1'),
              slogan2: allTranslations.text('slogant2'),
              mainColor: "145528",
              offreColor: "2196F3",
              demandeColor: "F44336",
              bioColor: "4CAF50",
              cancelColor: "D8322B",
              devise: DataConstantesUtils.DEVISE,
              callCenter: DataConstantesUtils.CALLCENTER),
        ),
      ],
      child: MyApp(),
    ),
  );*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        ///Principale
        primaryColor: mainColor,
        backgroundColor: mainBackground,
        scaffoldBackgroundColor: mainBackground,
        colorScheme: ColorScheme.fromSwatch(
                primarySwatch: FunctionUtils.createMaterialColor("5770E7"))
            .copyWith(
          secondary: secondColor,
        ),

        ///Appbar
        appBarTheme: const AppBarTheme(
          backgroundColor: appBarColor,
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actionsIconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Calibri',
          ),
        ),

        ///FLoating action button
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: mainColor,
          elevation: 2,
        ),

        ///Dialog box
        dialogTheme: const DialogTheme(
          backgroundColor: dialogBackground,
        ),

        ///Card
        // cardColor: cardBackground,
        cardTheme: const CardTheme(
          color: cardBackground,
          elevation: 2,
          shadowColor: shadowColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),

        /// Texe
        textTheme: Theme.of(context).textTheme.apply(
              // fontFamily: 'Montserrat',
              fontFamily: 'Calibri',
              bodyColor: Colors.black,
              fontSizeFactor: 0.9,
              fontSizeDelta: 2.0,
              //displayColor: primaryColor
            ),
      ),
      home: const LaunchPage(),
      // home: const HomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
