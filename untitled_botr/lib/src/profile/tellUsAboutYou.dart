import 'package:flutter/material.dart';
import 'package:untitled_botr/shared/presentation/router.dart';
import 'package:untitled_botr/src/profile/birthdayPage.dart';

import 'emailPage.dart';
import 'genderPage.dart';
import 'namePage.dart';
import 'whereDoYouWorshipPage.dart';

class TellUsAboutYou extends StatefulWidget {
  const TellUsAboutYou({super.key});

  @override
  State<TellUsAboutYou> createState() => _TellUsAboutYouState();
}

class _TellUsAboutYouState extends State<TellUsAboutYou> {
  final PageController _controller = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.5),
          child: Container(
            height: 1,
            color: Colors.grey.shade300,
          ),
        ),
        title: Text(
          'Tell us about yourself',
          style:
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          onPageChanged: (int page) {
            _currentPage.value = page;
          },
          children: [
            NamePage(onNextPressed: () {
              _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            }),
            EmailPage(onNextPressed: () {
              _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            }),
            BirthdayPage(onNextPressed: () {
              _controller.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            }),
            GenderPage(onNextPressed: () {
              Navigator.push(context, CustomPageRouteBuilder(const WhereDoYouWorshipPage()));
            }),
          ],
        ),
      ),
    );
  }
}
