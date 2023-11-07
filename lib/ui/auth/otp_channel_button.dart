import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OTPChannelButton extends StatelessWidget {
  const OTPChannelButton({
    super.key,
    required this.channel,
  });
  final String channel;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.goNamed('otp', pathParameters: {'channel': channel});
      },
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.1),
        padding: const EdgeInsets.all(24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Send code via $channel'),
                Text(
                  channel == 'email' ? 'm******@email.com' : '*******354',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Icon(channel == 'email' ? Icons.email_outlined : Icons.sms_outlined),
        ],
      ),
    );
  }
}
