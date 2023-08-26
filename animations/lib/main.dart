import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4));
    _animation = Tween<double>(begin: 0.0, end: 2*pi).animate(_controller);
    _controller.repeat();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Center(child: AnimatedBuilder(animation: _controller, builder: (BuildContext context, Widget? child) { 
          return Transform(
            alignment: Alignment.topLeft,
              transform: Matrix4.identity()..rotateZ(_animation.value),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  blurRadius: 7,
                  spreadRadius: 5
                )]
              ),
            ),
          );
        },
        )),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
