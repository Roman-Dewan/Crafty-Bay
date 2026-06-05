import 'package:flutter/material.dart';

import '../../../../app/controllers/auth_controllers.dart';
import '../../../shared/presentation/screens/bottom_nav_bar.dart';
import '../../../shared/presentation/widgets/center_circular_widget.dart';
import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = "/";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String _version = "1.0.1";
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await AuthControllers.isUserLoggedIn();
    if (isLoggedIn) {
      await AuthControllers.getUserData();
    }
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      BottomNavBar.name,
      (route) => false,
    );
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
              CenterCircularWidget(),
              const SizedBox(height: 8),
              Text("version: $_version"),
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
