import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../app/extensions/localization_extension.dart';
import '../../../../app/extensions/utils_extension.dart';
import '../providers/timer_provider.dart';

class OtpTimerWidget extends StatefulWidget {
  final VoidCallback onTapResend;

  const OtpTimerWidget({super.key, required this.onTapResend});

  @override
  State<OtpTimerWidget> createState() => _OtpTimerWidgetState();
}

class _OtpTimerWidgetState extends State<OtpTimerWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TimerProvider>().startTimer(60);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, timerProvider, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timerProvider.secondsRemaining == 0
                  ? context.l10n.codeExpired
                  : "${context.l10n.thisCodeWillExpireIn} ${formatTime(timerProvider.secondsRemaining)}",
              style: context.textTheme.bodyMedium,
            ),
            TextButton(
              onPressed: timerProvider.secondsRemaining == 0
                  ? widget.onTapResend
                  : null,
              child: Text(context.l10n.resendCode),
            ),
          ],
        );
      },
    );
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return "$minutes:${secs.toString().padLeft(2, '0')}";
  }
}
