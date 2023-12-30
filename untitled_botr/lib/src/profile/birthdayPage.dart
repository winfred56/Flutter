import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BirthdayPage extends StatefulWidget {
  const BirthdayPage(
      {super.key, required this.onNextPressed, this.restorationId});
  final VoidCallback onNextPressed;
  final String? restorationId;

  @override
  State<BirthdayPage> createState() => _BirthdayPageState();
}

class _BirthdayPageState extends State<BirthdayPage> with RestorationMixin {
  final RestorableDateTime _selectedDate = RestorableDateTime(DateTime.now());
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  @override
  String? get restorationId => widget.restorationId;

  TextEditingController dateController = TextEditingController();

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        dateController.text =
            DateFormat('dd/MM/yyyy').format(_selectedDate.value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What\'s your birthday?',
                style: theme.textTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
          TextField(
            controller: dateController,
            readOnly: true,
            decoration: const InputDecoration(
              suffixIcon: Icon(Icons.calendar_month_rounded),
              filled: false,
              hintText: 'Your Birthday',
            ),
            onTap: () => _restorableDatePickerRouteFuture.present(),
          ),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: widget.onNextPressed, child: const Text('Next')))
        ],
      ),
    );
  }
}
