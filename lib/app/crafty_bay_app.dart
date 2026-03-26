import 'package:crafty_bay/app/app_routes.dart';
import 'package:crafty_bay/app/providers/language_provider.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class CraftyBayApp extends StatelessWidget {
  const CraftyBayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: languageProvider.currentLocale,
            supportedLocales: languageProvider.supportedLocales,
            initialRoute: "/",
            onGenerateRoute: AppRoutes.onGenerateRoute,
            theme: ThemeData(),
            darkTheme: ThemeData(),
          );
        },
      ),
    );
  }
}
