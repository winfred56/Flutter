import 'package:flutter/material.dart';

import '../shared/images/images.dart';
import '../widgets/transactions.dart';

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
              Stack(
                children: [
                  /// Bottom card
                  Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.black,
                        ),
                        height: MediaQuery.of(context).size.height * 0.43,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                /// Send money to
                                const Padding(
                                  padding: EdgeInsets.only(top: 250.0, left: 10),
                                  child: Text("Send Money to",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0
                                    ),),
                                ),
                                Row(
                                  children: [
                                    /// people
                                    Stack(
                                      children: [
                                        Positioned(
                                            child: SizedBox(
                                              height: MediaQuery.of(context).size.height *
                                                  0.075,
                                              width: MediaQuery.of(context).size.width *
                                                  0.41,
                                            )),
                                        const Positioned(
                                            top: 10,
                                            left: 10,
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.orange,
                                              backgroundImage: NetworkImage(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjv-LlSn3OR47vA5HF_uL2jN2ha-9ZymPMzA&usqp=CAU'),
                                            )),
                                        const Positioned(
                                            top: 10,
                                            left: 45,
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.blue,
                                              backgroundImage: NetworkImage(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJyJxZzZmTbAz8VZLAymiFjWhPLxqNEjOIJQ&usqp=CAU'),
                                            )),
                                        const Positioned(
                                            top: 10,
                                            left: 85,
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.pink,
                                              backgroundImage: NetworkImage(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUncw5PB5syw9BIoymTrwyOjAqRlTZC1Rkew&usqp=CAU'),
                                            )),
                                        const Positioned(
                                            top: 10,
                                            left: 115,
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor: Colors.yellow,
                                              backgroundImage: NetworkImage(
                                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0sCAvrW1yFi0UYMgTZb113I0SwtW0dpby8Q&usqp=CAU'),
                                            )),
                                      ],
                                    )
                                  ],
                                ),

                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 250.0, left: 100),
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.white,),
                                  ),
                                  onPressed: (){},
                                  child: const Icon(
                                      Icons.search_rounded,
                                    color: Colors.black,
                                  ),),
                            ),
                          ],
                        ),
                      ),
                  ),
                  /// Visa Card showing Balance
                  Positioned(
                    child: Container(
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
                                ),
                              ),

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
                            padding: EdgeInsets.only(right: 250.0, top: 30),
                            child: Text(
                              "Balance 👁",
                              style: TextStyle(
                                  fontWeight: FontWeight.w300, fontSize: 18),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0, top: 10),
                                child: Text(
                                  "\$24,098.00",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600, fontSize: 28),
                                ),
                              ),
                              Image(
                                  height: MediaQuery.of(context).size.height * 0.05,
                                  image: const AssetImage(Images.visalogo))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const Padding(padding: EdgeInsets.symmetric(vertical: 10),),

              const Align(
                alignment: Alignment.topLeft,
                child: Text("Amount", style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20
                ),),
              ),

              const Padding(padding: EdgeInsets.symmetric(vertical: 8),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text("500.00 USD", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26
                    ),),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.greenAccent,),
                    ),
                    onPressed: ()=> Navigator.pushNamed(context, '/settings'),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                    ),),
                ],
              ),

              const Divider(height: 20, thickness: 1,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///Transactions
                  const Text("Transactions", style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22
                  ),),
                  /// View all Buttom
                  TextButton(onPressed: (){},
                      child: const Text("View all", style: TextStyle(
                        fontWeight: FontWeight.w400,
                        //fontSize: 22
                      ),),)
                ],
              ),
              const Transactions()
            ],
          ),
        ),
      ),
    );
  }
}
