import 'package:courier/ui/shared/header_text.dart';
import 'package:courier/ui/shared/logo.dart';
import 'package:courier/utils/go_router_helpers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final int oTPLength = 4;
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
          child: ListView(
            padding: EdgeInsets.only(
                top: 24, bottom: MediaQuery.of(context).viewPadding.bottom),
            children: [
              const Logo(),
              const SizedBox(height: 40),
              const HeaderText('Verification'), const SizedBox(height: 8),
              Text(
                'Enter the code sent to your ${getPathParameters(context)['channel']} inbox',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              PinCodeTextField(
                animationType: AnimationType.scale,
                appContext: context,
                length: oTPLength,
                onChanged: (val) {
                  if (val.length == oTPLength) {
                    context.goNamed('reset_password');
                  }
                },
                backgroundColor: Colors.transparent,
                // textStyle:
                //     titleMedium(context).copyWith(color: Colors.white),
                keyboardType: TextInputType.number,
                mainAxisAlignment: MainAxisAlignment.center,
                separatorBuilder: (context, index) => const SizedBox(width: 20),

                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  activeBorderWidth: .4,
                  inactiveBorderWidth: .4,
                  selectedBorderWidth: .8,
                  activeColor: Theme.of(context).colorScheme.primary,
                  selectedColor: Theme.of(context).colorScheme.primary,
                  inactiveColor: Colors.grey,
                ),
              ),
              const SizedBox(height: 40),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text('Login'),
              // ),
              // const SizedBox(height: 40),
              TextButton(
                //TODO: logic behind this
                onPressed: () {},
                child: const Text('Resend code in: 2:45'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
