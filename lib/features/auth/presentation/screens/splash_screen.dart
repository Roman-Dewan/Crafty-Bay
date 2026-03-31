import 'package:flutter/material.dart';

import '../../../shared/presentation/screens/bottom_nav_bar.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    if (mounted) {
      Navigator.pushReplacementNamed(context, BottomNavBar.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Expanded(child: AppLogo(height: 140)),
              CircularProgressIndicator(),
              SizedBox(height: 8),
              Text("version: 1.0.0"),
            ],
          ),
        ),
      ),
    );
  }
}
//  35 minutes

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
