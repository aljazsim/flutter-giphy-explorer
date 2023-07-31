import "package:flutter/material.dart";
import "package:giphy_explorer/components/app/app.dart";
import "package:giphy_explorer/components/app/app_model.dart";
import "package:giphy_explorer/dependency_injection.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DependencyInjection.setup();

  runApp(App(DependencyInjection.getInstance<AppModel>()));
}
