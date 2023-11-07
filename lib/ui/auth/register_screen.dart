import 'package:courier/ui/auth/oauth_buttons.dart';
import 'package:courier/ui/shared/custom_text_form_fields.dart';
import 'package:courier/ui/shared/custom_text_span.dart';
import 'package:courier/ui/shared/header_text.dart';
import 'package:courier/ui/shared/logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> tncNotifier = ValueNotifier(false);

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
                const HeaderText('Register'),
                const SizedBox(height: 20),
                AuthTextFormField(
                  controller: nameController,
                  authTextFieldType: AuthTextFieldType.name,
                ),
                const SizedBox(height: 20),
                AuthTextFormField(
                  controller: emailController,
                  authTextFieldType: AuthTextFieldType.email,
                ),
                const SizedBox(height: 20),
                AuthTextFormField(
                  controller: phoneController,
                  authTextFieldType: AuthTextFieldType.phone,
                ),
                const SizedBox(height: 20),
                AuthTextFormField(
                  controller: passwordController,
                  authTextFieldType: AuthTextFieldType.password,
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    tncNotifier.value = !tncNotifier.value;
                  },
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: tncNotifier,
                        builder: (context, value, child) {
                          return Checkbox(
                            value: value,
                            onChanged: (val) {
                              tncNotifier.value = !value;
                            },
                          );
                        },
                      ),
                      const Text('Agree to Terms and Conditions'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.goNamed('home');
                  },
                  child: const Text('Register'),
                ),
                const SizedBox(height: 40),
                CustomTextSpan(
                  firstText: 'Already have an account?',
                  secondText: 'Login',
                  onPressed: () {
                    context.goNamed('login');
                  },
                ),
                const SizedBox(height: 40),
                const GoogleOAuthButton(),
                const SizedBox(height: 20),
                const AppleOAuthButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    tncNotifier.dispose();

    super.dispose();
  }
}
