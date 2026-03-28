import 'package:crafty_bay/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/utils/validators.dart';
import '../widgets/app_logo.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = "/sign_in";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 64),
                  AppLogo(),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.signInWithEmail,
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
                    onPressed: _onTapSignInButton,
                    child: Text(context.l10n.signIn),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(context.l10n.dontHaveAccount),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    // if (_formKey.currentState!.validate()) {
    //
    Navigator.pushNamed(context, OtpVerificationScreen.name);
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
