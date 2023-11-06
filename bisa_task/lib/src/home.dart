import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class WordSearchGame extends StatelessWidget {
  const WordSearchGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Word Search Puzzle')),
            body: const WordSearchGrid()));
  }
}

class WordSearchGrid extends StatefulWidget {
  const WordSearchGrid({Key? key}) : super(key: key);

  @override
  _WordSearchGridState createState() => _WordSearchGridState();
}

class _WordSearchGridState extends State<WordSearchGrid> {
  final List<String> wordsToFind = [
    'FLUTTER',
    'WORD',
    'PUZZLE'
  ]; // Add your words here
  final List<String> grid = [
    'FLOUWOBZW',
    'RTUSOIPUO',
    'PUZZLEROR',
    'PAKODTFLD',
    'FLUTTERES',
  ];
  double cellSize = 0;

  List<WordSelection> selectedWords = [];
  List<String> foundWords = [];
  late ConfettiController _controllerCenterRight;

  @override
  void initState() {
    super.initState();
    _controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
  }

  @override
  void dispose() {
    _controllerCenterRight.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Calculate the cell size based on available width and number of columns
    cellSize = MediaQuery.of(context).size.width / (grid[0].length);
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.0,
              crossAxisCount: grid[0].length,
            ),
            itemCount: grid.length * grid[0].length,
            itemBuilder: (BuildContext context, int index) {
              final int row = index ~/ grid[0].length;
              final int col = index % grid[0].length;
              final String letter = grid[row][col];

              return GestureDetector(
                  onTapDown: (details) {
                    setState(() {
                      //selectedWords.clear();
                      print(details.globalPosition);
                      selectedWords
                          .add(WordSelection([WordCell(row, col, letter)]));
                      print('${WordCell(row, col, letter).row}');
                      print('${WordCell(row, col, letter).col}');
                    });
                  },
                  onPanUpdate: (details) {
                    print(selectedWords.map((e) => e.getWord()));
                    print(
                        '====================================================');
                    final WordCell cell = WordCell(row, col, letter);
                    print(cell.letter);
                    if (selectedWords.isEmpty) {
                      selectedWords.add(WordSelection([cell]));
                      print(
                          '======================== $selectedWords ===========================');
                    } else {
                      final WordCell lastCell = selectedWords.last.cells.last;
                      if (lastCell.isAdjacentTo(cell)) {
                        setState(() {
                          selectedWords.last.cells.add(cell);
                          print(
                              '======================== $selectedWords ===========================');
                        });
                      }
                    }
                  },
                  // onPanUpdate: (details) {
                  //   // Calculate the cell index based on the drag position
                  //   int newRow = (details.localPosition.dy / cellSize).floor();
                  //   int newCol = (details.localPosition.dx / cellSize).floor();
                  //
                  //   // Ensure the new row and column are within valid bounds
                  //   if (newRow >= 0 && newRow < grid.length && newCol >= 0 && newCol < grid[0].length) {
                  //     final WordCell newCell = WordCell(newRow, newCol, grid[newRow][newCol]);
                  //
                  //     if (selectedWords.isEmpty) {
                  //       selectedWords.add(WordSelection([newCell]));
                  //     } else {
                  //       final WordCell lastCell = selectedWords.last.cells.last;
                  //       if (lastCell.isAdjacentTo(newCell)) {
                  //         setState(() {
                  //           selectedWords.last.cells.add(newCell);
                  //         });
                  //       }
                  //     }
                  //   }
                  // },
                  onPanEnd: (details) {
                    // Check if a selected word matches any of the words to find
                    final String selectedWord =
                        selectedWords.map((ws) => ws.getWord()).join();
                    print(':::: $selectedWord');
                    if (wordsToFind.contains(selectedWord)) {
                      // Handle the found word, e.g., add to a list of found words
                      print('Found word: $selectedWord');
                      foundWords.add(selectedWord);
                    }
                    if (foundWords.length == wordsToFind.length) {
                      _controllerCenterRight.play();
                      foundWords.clear();
                    }
                    setState(() {
                      selectedWords.clear();
                    });
                  },
                  child: Container(
                      width: 80,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(border: Border.all()
                          // color: selectedWords.any((ws) => ws.contains(WordCell(row, col, letter)))
                          //     ? Colors.red
                          //     : Colors.white,
                          ),
                      child: Text(letter)));
            }),
        Align(
            alignment: Alignment.centerRight,
            child: ConfettiWidget(
                confettiController: _controllerCenterRight,
                blastDirection: pi,
                particleDrag: 0.05,
                emissionFrequency: 0.05,
                numberOfParticles: 20,
                gravity: 0.05,
                shouldLoop: false,
                colors: const [Colors.green, Colors.blue, Colors.pink],
                strokeWidth: 1,
                strokeColor: Colors.white))
      ]);
    });
  }
}

class WordCell {
  final int row;
  final int col;
  final String letter;

  WordCell(this.row, this.col, this.letter);

  bool isAdjacentTo(WordCell other) {
    return (row == other.row &&
            (col - 1 == other.col || col + 1 == other.col)) ||
        (col == other.col && (row - 1 == other.row || row + 1 == other.row)) ||
        (row - 1 == other.row && col - 1 == other.col) ||
        (row + 1 == other.row && col + 1 == other.col) ||
        (row - 1 == other.row && col + 1 == other.col) ||
        (row + 1 == other.row && col - 1 == other.col);
  }
}

class WordSelection {
  final List<WordCell> cells;

  WordSelection(this.cells);

  String getWord() {
    return cells.map((cell) => cell.letter).join();
  }

  bool contains(WordCell cell) {
    return cells.contains(cell);
  }
}
