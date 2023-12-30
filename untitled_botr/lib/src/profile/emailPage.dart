import 'package:flutter/material.dart';

class EmailPage extends StatelessWidget {
  final VoidCallback onNextPressed;

  const EmailPage({Key? key, required this.onNextPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What\'s your email?',
                style: theme.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: 'Enter your email address',
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 2)),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
                'This information helps BOTR to improve the content you see and keep the BOTR community safe. Your information will be well protected.',
                style: theme.textTheme.bodySmall),
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onNextPressed,
              child: const Text('Next'),
            ),
          )
        ],
      ),
    );
  }
}
