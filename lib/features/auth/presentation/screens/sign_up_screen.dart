import 'package:crafty_bay/features/auth/presentation/screens/otp_verification_screen.dart';
import 'package:flutter/material.dart';

import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/utils/validators.dart';
import '../widgets/app_logo.dart';

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
                    "Sign Up with email",
                    style: context.textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Get started with your details",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: "Email"),
                    validator: (value) => Validators.validatorEmail(
                      value,
                      msg: "Email address is required",
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "First Name"),
                    validator: (value) => Validators.validatorText(
                      value,
                      msg: "First Name is required",
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "Last Name"),
                    validator: (value) => Validators.validatorText(
                      value,
                      msg: "Last Name is required",
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: "Phone"),
                    validator: (value) => Validators.validatorBDPhone(
                      value,
                      msg: "Phone number is required",
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "City"),
                    validator: (value) => Validators.validatorText(
                      value,
                      msg: "City is required",
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(hintText: "Password"),
                    validator: (value) => Validators.validatorPassword(
                      value,
                      msg: "Password is required",
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _onTapSignUpButton,
                    child: Text("Sign Up"),
                  ),
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
