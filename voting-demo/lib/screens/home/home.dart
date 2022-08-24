import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:voting_demo/models/position.dart';
import 'package:voting_demo/screens/voting_page.dart';
import 'package:voting_demo/services/AuthenticationService.dart';
import 'package:voting_demo/services/getPositionsService.dart';

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
            TextButton.icon(
              onPressed: () async {
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
          ]),
      body: Column(
        children: [
          Expanded(
            child: Theme(
              data: ThemeData(
                shadowColor: Colors.white,
                primaryColor: Colors.white,
                colorScheme: ColorScheme.light(primary: HexColor('#732424')),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      'Select Election to vote',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  FutureBuilder<List<Position>>(
                      future: getAllPositions(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.requireData.isNotEmpty) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: ListView.builder(
                                padding: const EdgeInsets.all(8),
                                itemCount: snapshot.requireData.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => VotingPage(
                                          position: snapshot.requireData[index],
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        color: Colors.green[300],
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          snapshot.requireData[index].position,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text('Something went wrong !!!'),
                          );
                        }
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: CircularProgressIndicator.adaptive(),
                          ),
                        );
                      }),
                ],
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

//Text(snapshot.requireData[index].position)
