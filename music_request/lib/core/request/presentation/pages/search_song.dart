import 'package:flutter/material.dart';

class SearchSongPage extends StatefulWidget {
  const SearchSongPage({Key? key}) : super(key: key);

  @override
  State<SearchSongPage> createState() => _SearchSongPageState();
}

class _SearchSongPageState extends State<SearchSongPage> {
  TextEditingController songController = TextEditingController();

  /// Loading Notifier
  final loading = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(minimum: const EdgeInsets.symmetric(horizontal: 15),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(children: [
      Center(
              child: TextFormField(
                  controller: songController,
                  decoration:
                      const InputDecoration(hintText: 'Search for a song'))),
      SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: double.infinity,
              child: ValueListenableBuilder<bool>(
                  valueListenable: loading,
                  builder: (context, value, child) {
                    return ElevatedButton(
                        onPressed: () async {},
                        child: value
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text('Search',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface)));
                  }))
    ])
          )
        ));
  }
}
