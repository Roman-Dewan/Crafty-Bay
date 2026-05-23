import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../../../shared/presentation/screens/bottom_nav_bar.dart';
import '../../../shared/presentation/widgets/center_circular_widget.dart';
import '../../../shared/presentation/widgets/snac_bar_message.dart';
import '../providers/timer_provider.dart';
import '../providers/verify_otp_provider.dart';
import '../widgets/app_logo.dart';
import '../widgets/otp_timer_widget.dart';
import 'sign_in_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});
  static const String name = "/otp_verification";

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final _otpController = PinInputController();

  final VerifyOtpProvider _verifyOtpProvider = VerifyOtpProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: _verifyOtpProvider,
        child: Padding(
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
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: MaterialPinFormField(
                  pinController: _otpController,
                  length: 4,
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
              Consumer<VerifyOtpProvider>(
                builder: (context, provider, child) {
                  return Visibility(
                    visible: provider.verifyOtpProgress == false,
                    replacement: const CenterCircularWidget(),
                    child: FilledButton(
                      onPressed: _otpController.text.length == 4
                          ? () => _onTapVerifyButton(_otpController.text)
                          : null,
                      child: Text(context.l10n.verify),
                    ),
                  );
                },
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
      ),
    );
  }

  void _onTapResendCode() {
    _otpController.clear();
    context.read<TimerProvider>().startTimer(60);
    log("Resend code");
  }

  void _onTapVerifyButton(String pin) {
    if (pin.length == 4) {
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async {
    final isSuccess = await _verifyOtpProvider.verifyOtp(
      email: widget.email,
      otp: _otpController.text,
    );
    if (mounted) {
      if (isSuccess) {
        snackBarMessage(context, "OTP verified successfully", true);
        Navigator.pushNamedAndRemoveUntil(
          context,
          BottomNavBar.name,
          (route) => false,
        );
      } else {
        snackBarMessage(
          context,
          _verifyOtpProvider.errorMessage ?? "Failed to verify OTP",
          false,
        );
      }
    }
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
}
