import 'package:flutter/material.dart';

import '../../../../core/user/presentation/pages/profile.dart';
import '../../../library/presentation/pages/library.dart';
import '../../../../core/request/presentation/pages/request_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(initialPage: 1);
  ValueNotifier<int> currentPage = ValueNotifier<int>(1);

  void onPageSelected(int index) {
    setState(() {
      _controller.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      currentPage.value = _controller.page!.round();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            builder: (BuildContext context, value, _) {
              return Column(children: [
                Expanded(
                    child: PageView(controller: _controller, children: [
                      const LibraryPage(),
                      RequestPage(onPageSelected: onPageSelected),
                      const ProfilePage()
                    ]))
              ]);
            },
            valueListenable: currentPage));
  }
}
