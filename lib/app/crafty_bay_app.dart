import 'package:crafty_bay/app/app_routes.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('en'),
      supportedLocales: [
        Locale('en'), // English
        Locale('bn'), // Bangla
      ],
      initialRoute: "/",
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData(),
      darkTheme: ThemeData(),
    );
  }
}
