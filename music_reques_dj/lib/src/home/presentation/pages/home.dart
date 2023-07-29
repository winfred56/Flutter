import 'package:flutter/material.dart';

import '../../../../core/requests/presentation/pages/pending_requests.dart';
import '../../../../core/user/domain/entities/user.dart';
import '../../../../core/user/presentation/pages/profile.dart';
import '../../../../injection_container.dart';
import '../../../library/presentation/pages/library.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Controller
  final PageController _controller = PageController(initialPage: 1);
  ValueNotifier<int> currentPage = ValueNotifier<int>(1);

  /// Bloc
  final bloc = sl<HomeBloc>();

  /// Current User
  User user = User.initial();
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
    WidgetsBinding.instance.addPostFrameCallback(
        (_) async => user = await bloc.getAuthenticatedUser());
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
                  LibraryPage(user: user),
                  PendingRequestsPage(user: user),
                  //  DownloadQrPage(onPageSelected: onPageSelected),
                  ProfilePage(user: user)
                ]))
              ]);
            },
            valueListenable: currentPage));
  }
}
