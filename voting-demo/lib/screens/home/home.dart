import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:voting_demo/services/AuthenticationService.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  /// Instance of the Authentication class
  final Authentications _auth = Authentications();

  /// variable to identity current step in stepper
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(99, 12, 12, 10),
          title: const Text('ELECT'),
          actions: [
            TextButton.icon(onPressed: () async {
              await _auth.signOut();
            },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              label: const Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ]
      ),
      body: Column(
        children: [
          Expanded(
              child: Theme(
                data: ThemeData(
                  shadowColor: Colors.white,
                  primaryColor: Colors.white,
                  colorScheme: ColorScheme.light(primary: HexColor('#732424')),
                ), child: Stepper(
                currentStep: _currentStep,
                type: StepperType.horizontal,
                steps: [
                   const Step(
                      title: Text('Choose'),
                      content:  Text("List Of Votes Comes Here"),
                      isActive: true
                  ),
                  Step(
                      title: const Text('Vote'),
                      content: const Text("List of Candidates to be voted for comes here"),
                      isActive: _currentStep >= 1 ? true : false
                  ),
                ],
                onStepContinue: () => setState(() {
                  _currentStep = (_currentStep + 1) > 1 ? 1 : _currentStep+1;
                }),
                onStepCancel: () => setState(() {
                  _currentStep -=1;
                }),
              ),
              ),
          )
        ],
      ),
    );
  }
  /// Function to display Snackbar
void showSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      msg,
      style: const TextStyle(fontSize: 22),
    ),
  ));
}

}
