import 'package:flutter/material.dart';

import '../shared/images/images.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white30,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Notifications icon
              Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: .4),
                  ),
                  child: const Icon(
                    Icons.notifications_none_rounded,
                    color: Colors.black,
                  )),

              /// Avatar
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZiGYoDbhlNV3vfyD5k6O6ieCofmcldsAbVQ&usqp=CAU'),
                backgroundColor: Colors.yellow,
              )
            ],
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          child: SingleChildScrollView(
              child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        /// chip
                        Image(
                            height: MediaQuery.of(context).size.height * 0.1,
                            image: const AssetImage(
                              Images.chip,
                            )),

                        /// Bank Name
                        const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Text(
                            "DS Bank",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right:  250.0, top: 30),
                      child: Text("Balance 👁", style: TextStyle(
                          fontWeight: FontWeight.w300, fontSize: 18),),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0, top: 10),
                          child: Text("\$24,098.00", style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 28),),
                        ),
                        Image(
                          height: MediaQuery.of(context).size.height * 0.05,
                            image: const AssetImage(Images.visalogo))
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
        ));
  }
}
