import 'package:courier/ui/shared/custom_text_form_fields.dart';
import 'package:courier/ui/shared/header_text.dart';
import 'package:courier/ui/shared/logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
                const SizedBox(height: 40),
                const HeaderText('Enter new password'),
                // const SizedBox(height: 8),
                // const Text(
                //   'Enter your new password.',
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(height: 40),
                AuthTextFormField(
                  controller: passwordController,
                  authTextFieldType: AuthTextFieldType.password,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.goNamed('home');
                  },
                  child: const Text('RESET'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();

    super.dispose();
  }
}
