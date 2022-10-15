import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

class Campaign extends StatefulWidget {
  const Campaign({Key? key}) : super(key: key);

  @override
  State<Campaign> createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#7f8080'),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: HexColor('#7f8080'),
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
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// Svg Picture
              SvgPicture.asset(
                "assets/svgs/modelling.svg",
                height: MediaQuery.of(context).size.height * 0.5,
              ),

              /// title text
              const Text(
                  "Start your\nCampaign now",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w600,
                ),
              ),

              /// Subtitle text
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Text(
                    "No hidden changes no stealth fees",
                  style: TextStyle(
                    color: Colors.white70
                  )

                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 70),),

              /// create campaign button
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.06,
                child: ElevatedButton(
                    onPressed: () =>  Navigator.pushNamed(context, '/social-media-profile'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black,),
                  ),
                    child: const Text(
                        "Create Campaign",
                      style: TextStyle(
                        color: Colors.white
                      )
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


