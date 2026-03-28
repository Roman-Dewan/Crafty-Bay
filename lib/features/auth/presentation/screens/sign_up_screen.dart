import 'package:flutter/material.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/utils/validators.dart';
import '../widgets/app_logo.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String name = "/sign_up";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _cityController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppLogo(),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.signUpWithEmail,
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.l10n.getStartedDetails,
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: context.l10n.email),
                    validator: (value) => Validators.validatorEmail(
                      value,
                      requiredMsg: context.l10n.emailRequired,
                      invalidMsg: context.l10n.invalidEmail,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: context.l10n.firstName,
                    ),
                    validator: (value) => Validators.validatorText(
                      value,
                      msg: context.l10n.firstNameRequired,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: context.l10n.lastName,
                    ),
                    validator: (value) => Validators.validatorText(
                      value,
                      msg: context.l10n.lastNameRequired,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: context.l10n.phone),
                    validator: (value) => Validators.validatorBDPhone(
                      value,
                      requiredMsg: context.l10n.phoneRequired,
                      invalidMsg: context.l10n.invalidPhone,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: context.l10n.city),
                    validator: (value) => Validators.validatorText(
                      value,
                      msg: context.l10n.cityRequired,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: context.l10n.password,
                    ),
                    validator: (value) => Validators.validatorPassword(
                      value,
                      requiredMsg: context.l10n.passwordRequired,
                      lengthMsg: context.l10n.passwordLength,
                      uppercaseMsg: context.l10n.passwordUppercase,
                      lowercaseMsg: context.l10n.passwordLowercase,
                      numberMsg: context.l10n.passwordNumber,
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _onTapSignUpButton,
                    child: Text(context.l10n.signUp),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignInScreen.name);
                    },
                    child: Text(context.l10n.alreadyHaveAccount),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     Locale locale = context
                  //         .read<LanguageProvider>()
                  //         .currentLocale;
                  //     if (locale == Locale('en')) {
                  //       context.read<LanguageProvider>().changeLocale(
                  //         Locale('bn'),
                  //       );
                  //     } else {
                  //       context.read<LanguageProvider>().changeLocale(
                  //         Locale('en'),
                  //       );
                  //     }
                  //   },
                  //   child: Text("Language button"),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    // if (_formKey.currentState!.validate()) {
    // }
    Navigator.pushNamed(context, SignInScreen.name);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
