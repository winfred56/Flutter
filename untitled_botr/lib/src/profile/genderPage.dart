import 'package:flutter/material.dart';

class GenderPage extends StatefulWidget {
  final VoidCallback onNextPressed;
  const GenderPage({super.key, required this.onNextPressed});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  final selectedGender = ValueNotifier<String?>('');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'What\'s your gender?',
              style: theme.textTheme.headlineMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
        Align(
          alignment: Alignment.centerLeft,
          child: Wrap(
            spacing: 8.0,
            children: [
              GenderChip(label: 'Male', selectedGender: selectedGender),
              GenderChip(label: 'Female', selectedGender: selectedGender),
              GenderChip(label: 'Non-binary', selectedGender: selectedGender),
              GenderChip(label: 'Other', selectedGender: selectedGender),
              GenderChip(
                  label: 'Prefer not to say', selectedGender: selectedGender),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: widget.onNextPressed, child: const Text('Next')),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 4))
      ],
    );
  }
}

class GenderChip extends StatelessWidget {
  final String label;
  final ValueNotifier<String?> selectedGender;

  const GenderChip(
      {Key? key, required this.label, required this.selectedGender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ValueListenableBuilder<String?>(
      valueListenable: selectedGender,
      builder: (context, value, child) {
        return ActionChip(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          side: BorderSide(
              color: value == label ? theme.colorScheme.primary : Colors.grey),
          label: Text(label,
              style: TextStyle(
                  color: value == label ? Colors.white : Colors.black)),
          onPressed: () {
            selectedGender.value = label;
          },
          backgroundColor:
              value == label ? theme.colorScheme.primary : Colors.transparent,
        );
      },
    );
  }
}
