import 'package:courier/utils/dimensions.dart';
import 'package:flutter/material.dart';

class AuthTextFormField extends StatefulWidget {
  const AuthTextFormField(
      {super.key, this.controller, this.authTextFieldType, this.hintText});
  final TextEditingController? controller;
  final AuthTextFieldType? authTextFieldType;
  final String? hintText;

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  late ValueNotifier<bool> obscureText;

  @override
  void initState() {
    super.initState();

    obscureText =
        ValueNotifier(widget.authTextFieldType == AuthTextFieldType.password);
  }

  Color fillColor = Colors.purple[100]!.withOpacity(.1);
  Color focusColor = Colors.purple[100]!.withOpacity(.3);
  Color disabledForegroundColor = Colors.white38;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: obscureText,
      builder: (context, value, child) {
        return TextFormField(
          controller: widget.controller,
          obscureText: value,
          keyboardType: _keyboardType(),
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
            filled: true,
            fillColor: fillColor,
            focusColor: focusColor,
            hintText: _hintText(),
            hintStyle: TextStyle(color: disabledForegroundColor),
            prefixIcon: Icon(_prefixIcon()),
            prefixIconColor: disabledForegroundColor,
            suffixIcon: widget.authTextFieldType == AuthTextFieldType.password
                ? GestureDetector(
                    onTap: () {
                      obscureText.value = !obscureText.value;
                    },
                    child: Icon(value
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldBorderRadius),
              borderSide: BorderSide(color: fillColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(textFieldBorderRadius),
              borderSide: BorderSide(color: focusColor),
            ),
          ),
        );
      },
    );
  }

  TextInputType? _keyboardType() {
    switch (widget.authTextFieldType) {
      case AuthTextFieldType.email:
        return TextInputType.emailAddress;
      case AuthTextFieldType.phone:
        return TextInputType.phone;
      case AuthTextFieldType.name:
        return TextInputType.name;
      default:
        return null;
    }
  }

  String? _hintText() {
    if (widget.hintText != null) return widget.hintText;

    switch (widget.authTextFieldType) {
      case AuthTextFieldType.email:
        return 'Email';
      case AuthTextFieldType.password:
        return 'Password';
      case AuthTextFieldType.phone:
        return 'Phone';
      case AuthTextFieldType.name:
        return 'Full name';
      default:
        return null;
    }
  }

  IconData? _prefixIcon() {
    switch (widget.authTextFieldType) {
      case AuthTextFieldType.email:
        return Icons.email_outlined;
      case AuthTextFieldType.password:
        return Icons.lock_outline_rounded;
      case AuthTextFieldType.phone:
        return Icons.phone_outlined;
      case AuthTextFieldType.name:
        return Icons.person_outline;
      default:
        return Icons.short_text_rounded;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}

enum AuthTextFieldType { email, password, phone, name }
