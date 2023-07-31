import "package:flutter/material.dart";
import "package:giphy_explorer/components/app/app_model.dart";

class App extends StatelessWidget {
  final AppModel _model;

  const App(AppModel model, {super.key}) : _model = model;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _model.getRouter(),
      title: "Giphy Explorer",
      theme: _model.getTheme(),
    );
  }
}
