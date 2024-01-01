import 'package:flutter/material.dart';
import 'package:untitled_botr/shared/presentation/router.dart';

import 'congratsPage.dart';

class WhereDoYouWorshipPage extends StatefulWidget {
  const WhereDoYouWorshipPage({super.key});

  @override
  State<WhereDoYouWorshipPage> createState() => _WhereDoYouWorshipPageState();
}

class _WhereDoYouWorshipPageState extends State<WhereDoYouWorshipPage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 24, 16, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Where do you worship?',
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You join a church or join individually',
                style: theme.textTheme.bodySmall,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            TextField(
              controller: searchController,
              decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search_rounded, color: Colors.grey)),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10),
                  itemCount: 36,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      onPressed: () {
                        showBottomSheet<void>(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (BuildContext context) {
                              return DraggableScrollableSheet(
                                builder: (BuildContext context,
                                    ScrollController scrollController) {
                                  return Container(
                                    color: Colors.white,
                                    child: ListView.builder(
                                      controller: scrollController,
                                      itemCount: 25,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                          onTap: () {
                                            Navigator.push(context, CustomPageRouteBuilder(const CongratsPage()));
                                          },
                                            title: Text('Branch $index'));
                                      },
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 44,
                          ),
                          Text('Pentecost', style: theme.textTheme.bodySmall)
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
