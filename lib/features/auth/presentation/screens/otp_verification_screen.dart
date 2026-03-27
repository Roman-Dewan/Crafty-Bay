import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../widgets/app_logo.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});
  static const String name = "/otp_verification";

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = PinInputController();
  int _secondsRemaining = 120;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            AppLogo(),
            const SizedBox(height: 24),
            Text(context.l10n.enterOtpCode, style: context.textTheme.titleLarge),
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
            Text(
              _secondsRemaining == 0
                  ? context.l10n.codeExpired
                  : "${context.l10n.thisCodeWillExpireIn} ${formatTime(_secondsRemaining)}",
              style: context.textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: _secondsRemaining == 0 ? _onTapResendCode : null,
              child: Text(context.l10n.resendCode),
            ),
          ],
        ),
      ),
    );
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return "$minutes:${secs.toString().padLeft(2, '0')}";
  }

  void _onTapResendCode() {
    _otpController.clear();
    _secondsRemaining = 120;
    _startTimer();
    log("Resend code");
  }

  void _onTapVerifyButton(String pin) {
    if (pin.length != 5) {
      return;
    }
    log('PIN: $pin');
  }

  Future<void> _startTimer() async {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }
}
