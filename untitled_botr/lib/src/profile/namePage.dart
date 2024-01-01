import 'package:flutter/material.dart';

class NamePage extends StatelessWidget {
  final VoidCallback onNextPressed;

  const NamePage({Key? key, required this.onNextPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final TextEditingController nameController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What\'s your name?',
                style: theme.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          TextFormField(
            keyboardType: TextInputType.name,
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Enter your full name',
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
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4))
        ],
      ),
    );
  }
}
