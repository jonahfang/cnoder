import "package:flutter/material.dart";
import "package:fluro/fluro.dart";
import "package:flutter_redux/flutter_redux.dart";
import "../config/application.dart";
import "../routes/index.dart";
import "../store.dart";

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
      return new AppState();
    }
}

class AppState extends State<App> {
  AppState() {
    final router = new Router();
    applyRoutes(router);
    Application.router = router;
  }

  @override
    Widget build(BuildContext context) {
      final app = new MaterialApp(
        title: 'CNoder',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.lightBlue
        ),
        onGenerateRoute: Application.router.generator,
      );
      print('initial route: ${app.initialRoute}');

      return new StoreProvider(
        store: store,
        child: app
      );
    }
}