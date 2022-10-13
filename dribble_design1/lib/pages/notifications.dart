import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#688b97'),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: HexColor('#688b97'),
        title: Align(
          alignment: Alignment.topRight,
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            backgroundImage: const NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAY6rHUk-UzP-qHRIW3EBWLYLN4wG53DvpKA&usqp=CAU"),
            child: Stack(
              children: const [
                Positioned(
                  top: 5,
                  right: 0.1,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        //minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: SizedBox(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Notifications
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, top: 20),
                        child: Text(
                          "Notifications",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w500),
                        ),
                      ),

                      /// View All Button
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),

                  /// Notification number
                  Positioned(
                    left: 195,
                    top: 10,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.06,
                      height: MediaQuery.of(context).size.height * 0.03,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.redAccent,
                      ),
                      child: const Center(
                        child: Text('3'),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                    ),
                    color: HexColor('#FFFFFF'),
                  ),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 30,
                      itemBuilder: (BuildContext context, int index){
                        return const ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundColor: Colors.blue,
                          ),
                          title: Text("Bob", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),

                          subtitle: Text("2 minutes ago"),
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
