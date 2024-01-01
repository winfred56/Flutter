import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController();
  final currentPage = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
