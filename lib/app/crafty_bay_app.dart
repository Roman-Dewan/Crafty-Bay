import 'package:crafty_bay/app/app_routes.dart';
import 'package:flutter/material.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(),
      darkTheme: ThemeData(),
    );
  }
}
