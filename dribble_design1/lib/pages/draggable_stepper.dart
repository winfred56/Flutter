import 'package:flutter/material.dart';

class DraggableStepper extends StatefulWidget {
  const DraggableStepper({Key? key}) : super(key: key);

  @override
  State<DraggableStepper> createState() => _DraggableStepperState();
}

class _DraggableStepperState extends State<DraggableStepper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black54
          ),
          DraggableScrollableSheet(
              maxChildSize: .9,
              minChildSize: .3,
              initialChildSize: .3,
              builder: (ctx, controller){
            controller: controller;
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
