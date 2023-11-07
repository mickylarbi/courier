import 'package:courier/ui/auth/otp_channel_button.dart';
import 'package:courier/ui/shared/custom_text_span.dart';
import 'package:courier/ui/shared/header_text.dart';
import 'package:courier/ui/shared/logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(
              24, MediaQuery.of(context).viewPadding.top, 24, 0),
          child: ListView(
            padding: EdgeInsets.only(
                top: 24, bottom: MediaQuery.of(context).viewPadding.bottom),
            children: [
              const Logo(),
              const SizedBox(height: 20),
              const HeaderText('Forgot Password?'),
              const SizedBox(height: 20),
              const Text(
                'You\'ll receive a code to help you reset your password',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              const OTPChannelButton(channel: 'email'),
              const SizedBox(height: 24),
              const OTPChannelButton(channel: 'sms'),
              const SizedBox(height: 40),
              CustomTextSpan(
                firstText: 'Don\'t have an account?',
                secondText: 'Register',
                onPressed: () {
                  context.goNamed('register');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
