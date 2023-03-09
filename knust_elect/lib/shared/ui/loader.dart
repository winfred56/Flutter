import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:nil/nil.dart';

/// A String value to show error message to user
/// When null thus validation passed, then execute onLoadingDone()
class LoadingPage extends StatelessWidget {
  /// Constructor
  const LoadingPage(
      {super.key,
        required this.errorText,
        this.onLoadingDone,
        required this.loadingText});

  /// Starts with an initial value of an empty string
  /// A string text for error message, and null value for validation passed
  final Future<String?> errorText;

  final String loadingText;

  /// Function called when loading has completed
  final VoidCallback? onLoadingDone;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
        initialData: '', // Empty data string to initiate a loading screen
        future: errorText,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                title: snapshot.data!.isNotEmpty
                    ? Text(
                  'Hmm, Something went wrong 😑',
                  style: Theme.of(context).textTheme.titleMedium!.apply(
                    fontSizeDelta: -1.5,
                    fontWeightDelta: 1,
                  ),
                )
                    : null,
                content: snapshot.data!.isNotEmpty
                    ? Text(snapshot.data!)
                    : Row(children: <Widget>[
                  const CircularProgressIndicator.adaptive(),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        loadingText,
                        style:
                        Theme.of(context).textTheme.titleMedium!.apply(
                          fontSizeDelta: -1.5,
                          fontWeightDelta: 1,
                        ),
                      ))
                ]),
                actions: snapshot.data!.isNotEmpty
                    ? <Widget>[
                  TextButton.icon(
                      icon: const Icon(Icons.refresh),
                      onPressed: () =>
                          Navigator.of(context).pop<bool>(false),
                      // Closes the loading screen and returns false
                      label: Text(
                        'Hmm, Something went wrong 😑',
                        style:
                        Theme.of(context).textTheme.titleMedium!.apply(
                          fontSizeDelta: -1.5,
                          fontWeightDelta: 1,
                        ),
                      )),
                ]
                    : null);
          }
          return Builder(builder: (context) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Navigator.of(context).pop<bool>(
                  true); // Closes the Loading Screen and returns true
              final call = onLoadingDone ?? () {};
              call();
            });
            return nil;
          });
        });
  }
}