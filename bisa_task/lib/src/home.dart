import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 6,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10) ,
            itemCount: 30, itemBuilder: (context, index){
              return GestureDetector(
                onPanStart: (details) {
                  // Record the starting position of the drag.
                  var startDragPosition = details.globalPosition;
                  print('=== start dra $startDragPosition');
                  // Check if the word under the cursor is in the puzzle.

                  //
                  // String? word = getWordUnderCursor(index);
                  // if (word != null) {
                  //   currentWord = word;
                  // }
                },
                onPanUpdate: (details) {
                  // Calculate the new position of the drag.
                  Offset newDragPosition = details.globalPosition;

                  print('=== Drag position updated to: $newDragPosition' );
                },
                onPanEnd: (details) {
                  print('=== Pan ended ===');
                },
                child: Text('AA'),
              );
        }),
      )),
    );
  }
}
