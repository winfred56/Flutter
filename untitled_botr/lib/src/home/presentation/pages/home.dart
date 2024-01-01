import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../posts/presentation/pages/posts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();
  final currentPage = ValueNotifier<int>(0);

  final ScrollController _scrollController = ScrollController();


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: [PostPage(scrollController: _scrollController), PostPage(scrollController: _scrollController,), PostPage(scrollController: _scrollController,), PostPage(scrollController: _scrollController,)]),
        bottomNavigationBar: AnimatedBuilder(
          animation: _scrollController,
          builder: (BuildContext context, Widget? child) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
              curve: Curves.fastEaseInToSlowEaseOut,
              height: _scrollController.position.userScrollDirection == ScrollDirection.reverse ? 0 : 60,
            child: child,
          ),
          child: Row(children: [
            buildNavItem(Icons.home, 0),
            buildNavItem(Icons.location_city, 1),
            buildNavItem(Icons.chat_bubble, 2),
            buildNavItem(Icons.person, 3)
          ]),
        ));
  }

  Widget buildNavItem(IconData icon, int index) {
    return ValueListenableBuilder<int>(
        valueListenable: currentPage,
        builder: (context, value, child) {
          return InkWell(
              onTap: () {
                currentPage.value = index;
                controller.animateToPage(index,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutSine);
              },
              child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 4,
                  decoration: BoxDecoration(color: Colors.grey.shade50),
                  child: Center(
                      child:
                          Stack(alignment: Alignment.bottomCenter, children: [
                    SizedBox(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 4,
                        child: Icon(icon,
                            color: currentPage.value == index
                                ? const Color.fromRGBO(54, 32, 93, 1)
                                : Colors.grey.shade500)),
                    if (currentPage.value == index)
                      Positioned(
                          bottom: 0,
                          child: Container(
                              height: 4,
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(54, 32, 93, 1),
                                  borderRadius: BorderRadius.circular(2)),
                              width:
                                  (MediaQuery.of(context).size.width / 4) / 4))
                  ]))));
        });
  }
}
