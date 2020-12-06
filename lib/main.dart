import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          accentColor: Colors.purple),
      themeMode: ThemeMode.system,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isOnline = false;
  bool _isInitialized = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleSpacing: 0,
          title: Row(
            children: <Widget>[
              IconButton(icon: Icon(Icons.info), onPressed: () {})
            ],
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.settings), onPressed: () {})
          ],
        ),
        body: Stack(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Home controller",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w500))),
          Center(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundColor: _isInitialized
                    ? _isOnline
                        ? Colors.lightGreen
                        : Colors.red
                    : Colors.grey,
                child: IconButton(
                    icon: Icon(
                        _isInitialized
                            ? Icons.power_settings_new
                            : Icons.hourglass_empty,
                        color: Theme.of(context).textTheme.bodyText1.color),
                    iconSize: 100,
                    onPressed: () {
                      print("test");
                    }),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                      _isInitialized
                          ? _isOnline
                              ? "Press to power off"
                              : "Press to power on"
                          : "Device state loading ...",
                      style: Theme.of(context).textTheme.headline5)),
            ],
          ))
        ]));
  }
}
