import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../providers/timer_provider.dart';
import '../widgets/app_logo.dart';
import '../widgets/otp_timer_widget.dart';
import 'sign_in_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});
  static const String name = "/otp_verification";

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = PinInputController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            const AppLogo(),
            const SizedBox(height: 24),
            Text(
              context.l10n.enterOtpCode,
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 5),
            Text(
              context.l10n.otpSentMsg,
              style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            Center(
              child: MaterialPinFormField(
                pinController: _otpController,
                length: 5,
                onCompleted: _onTapVerifyButton,
                theme: MaterialPinTheme(
                  borderColor: Colors.grey,
                  fillColor: Colors.white,
                  shape: MaterialPinShape.outlined,
                  cellSize: Size(56, 64),
                ),
              ),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _otpController.text.length == 5
                  ? () => _onTapVerifyButton(_otpController.text)
                  : null,
              child: Text(context.l10n.verify),
            ),

            const SizedBox(height: 24),
            OtpTimerWidget(onTapResend: _onTapResendCode),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.name);
              },
              child: Text(context.l10n.alreadyHaveAccount),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapResendCode() {
    _otpController.clear();
    context.read<TimerProvider>().startTimer(60);
    log("Resend code");
  }

  void _onTapVerifyButton(String pin) {
    if (pin.length != 5) {
      return;
    }
    log('PIN: $pin');
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
