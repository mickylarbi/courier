import 'package:courier/ui/shared/header_text.dart';
import 'package:courier/ui/auth/oauth_buttons.dart';
import 'package:courier/ui/shared/custom_text_form_fields.dart';
import 'package:courier/ui/shared/custom_text_span.dart';
import 'package:courier/ui/shared/logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.fromLTRB(
              24, MediaQuery.of(context).viewPadding.top, 24, 0),
          child: Form(
            child: ListView(
              padding: EdgeInsets.only(
                  top: 24, bottom: MediaQuery.of(context).viewPadding.bottom),
              children: [
                const Logo(),
                const SizedBox(height: 20),
                const HeaderText('Login'),
                const SizedBox(height: 20),
                AuthTextFormField(
                  controller: emailController,
                  authTextFieldType: AuthTextFieldType.email,
                ),
                const SizedBox(height: 20),
                AuthTextFormField(
                  controller: passwordController,
                  authTextFieldType: AuthTextFieldType.password,
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.goNamed('forgot_password');
                    },
                    child: const Text('Forgot password?'),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.goNamed('home');
                  },
                  child: const Text('Login'),
                ),
                const SizedBox(height: 40),
                CustomTextSpan(
                  firstText: 'Don\'t have an account?',
                  secondText: 'Register',
                  onPressed: () {
                    context.goNamed('register');
                  },
                ),
                const SizedBox(height: 40),
                const GoogleOAuthButton(),
                const SizedBox(height: 20),
                const AppleOAuthButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
