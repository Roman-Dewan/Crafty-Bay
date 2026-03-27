import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/app/providers/language_provider.dart';
import 'package:crafty_bay/app/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = context.read<LanguageProvider>();
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.hello)),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}

/*
body: Column(
  children: [
    // ElevatedButton(
    //   onPressed: () {
    //     Locale locale = context.read<LanguageProvider>().currentLocale;
    //     if (locale == Locale('en')) {
    //       context.read<LanguageProvider>().changeLocale(Locale('bn'));
    //     } else {
    //       context.read<LanguageProvider>().changeLocale(Locale('en'));
    //     }
    //   },
    //   child: Text("Language button"),
    // ),
    // Text(context.l10n.changeYourLanguage),
    // DropdownMenu(
    //   dropdownMenuEntries: languageProvider.supportedLocales
    //       .map(
    //         (e) => DropdownMenuEntry(
    //           value: e,
    //           label: languageProvider.getLocaleDisplayName(e),
    //         ),
    //       )
    //       .toList(),
    //   initialSelection: languageProvider.currentLocale,
    //   onSelected: (value) {
    //     languageProvider.changeLocale(value!);
    //   },
    // ),
    // ElevatedButton(
    //   onPressed: () {
    //     context.read<ThemeProvider>().toggleTheme();
    //   },
    //   child: Text("Theme button"),
    // ),
    // ToggleButtons(
    //   fillColor: Colors.green,
    //   selectedColor: Colors.white,
    //   isSelected: [
    //     context.watch<ThemeProvider>().themeMode == ThemeMode.light ||
    //         context.watch<ThemeProvider>().themeMode == ThemeMode.system,
    //     context.watch<ThemeProvider>().themeMode == ThemeMode.dark,
    //   ],
    //   onPressed: (index) {
    //     if (index == 0) {
    //       context.read<ThemeProvider>().setThemeMode(ThemeMode.light);
    //     } else {
    //       context.read<ThemeProvider>().setThemeMode(ThemeMode.dark);
    //     }
    //   },
    //   children: [Text("Light"), Text("Dark")],
    // ),
    // CupertinoSwitch(
    //   activeColor: Colors.black,
    //   value: context.watch<ThemeProvider>().themeMode == ThemeMode.dark,
    //   onChanged: (value) {
    //     if (value) {
    //       context.read<ThemeProvider>().setThemeMode(ThemeMode.dark);
    //     } else {
    //       context.read<ThemeProvider>().setThemeMode(ThemeMode.light);
    //     }
    //   },
    // ),
  ],
),
*/
