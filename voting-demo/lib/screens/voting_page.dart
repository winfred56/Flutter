import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:voting_demo/models/candidate.dart';
import 'package:voting_demo/services/getCandidatesByPositionService.dart';
import 'package:voting_demo/services/votingService.dart';

import '../models/position.dart';
import '../services/AuthenticationService.dart';

class VotingPage extends StatefulWidget {
  const VotingPage({Key? key, required this.position}) : super(key: key);

  @override
  State<VotingPage> createState() => _VotingPageState();

  /// Filters Candidates related to positions
  final Position position;
}

class _VotingPageState extends State<VotingPage> {
  /// Instance of the Authentication class
  final Authentications _auth = Authentications();

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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Text(
                      'Vote for favorite Candidate 😁',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  FutureBuilder<List<Candidate>>(
                      future: getCandidatesByPosition(widget.position),
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
                                    onTap: () async {
                                      await voteForCandidate(
                                          snapshot.requireData[index]);

                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Thank you for voting',
                                            style: TextStyle(fontSize: 22),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        color: Colors.green[300],
                                        padding: const EdgeInsets.all(15),
                                        child: Text(
                                          snapshot.requireData[index].name,
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
                        } else if (snapshot.hasData &&
                            snapshot.requireData.isEmpty) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(vertical: 300),
                            child: Center(
                              child: Text('No candidate for this position 😢'),
                            ),
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
}
