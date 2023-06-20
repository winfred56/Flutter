import 'package:flutter/material.dart';
import 'dart:async';


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
        useMaterial3: true
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page')
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            PulsingContainer(),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class PulsingContainer extends StatefulWidget {
  @override
  _PulsingContainerState createState() => _PulsingContainerState();
}

class _PulsingContainerState extends State<PulsingContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
    _sizeAnimation = Tween<double>(begin: 50.0, end: 100.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Container(
          width: _sizeAnimation.value,
          height: _sizeAnimation.value,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Icon(Icons.earbuds),
        );
      },

    );
  }
}


// class PulsingContainer extends StatefulWidget {
//   @override
//   _PulsingContainerState createState() => _PulsingContainerState();
// }
//
// class _PulsingContainerState extends State<PulsingContainer> {
//   bool isExpanded = false;
//   double containerSize = 50.0;
//   double maxContainerSize = 100.0;
//   double minContainerSize = 50.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _startPulseAnimation();
//   }
//
//   void _startPulseAnimation() {
//     Timer.periodic(Duration(milliseconds: 1000), (timer) {
//       setState(() {
//         isExpanded = !isExpanded;
//         containerSize = isExpanded ? maxContainerSize : minContainerSize;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       width: containerSize,
//       height: containerSize,
//       duration: Duration(milliseconds: 500),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Theme.of(context).colorScheme.primary,
//       ),
//       child: Icon(Icons.earbuds),
//     );
//   }
// }
