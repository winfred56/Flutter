import 'package:flutter/material.dart';


class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(children: [
            Container(
                height: media.size.height * 0.15,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue, Colors.green]))),
            const Positioned.fill(child: Center(child: Text('ABOUT US', style: TextStyle(fontSize: 28, color: Colors.white))))
          ]),
          const SafeArea(minimum: EdgeInsets.symmetric(horizontal: 15),
              child: Column(children: [
                Text('🎵 Welcome to our Music Request App! 🎵', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(textAlign: TextAlign.center,'We are all about bringing the beats and making your musical experiences unforgettable! 🎶🎉')
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 8, right: 8),
                    child: Text(textAlign: TextAlign.center,'This app is a 3rd-year computer science mini project that aims to elevate your music party vibes to the next level! 🚀💻')
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Align(alignment:Alignment.centerLeft,child: Text('Here\'s how it works:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17))),
                Padding(padding: EdgeInsets.only(top: 20)),
                Align(alignment:Alignment.centerLeft, child: Text(textAlign: TextAlign.center,'🎧 For DJs:', style: TextStyle(fontWeight: FontWeight.w500))),
                Padding(padding: EdgeInsets.only(top: 10)),
                Align(alignment:Alignment.centerLeft, child: Text(textAlign: TextAlign.left,'If you\'re a DJ, you can generate a unique QR code that represents your party vibes! Share this code with your audience, and they can easily scan it using their app to access your playlist. You\'ll receive all the song requests from your enthusiastic crowd, and it\'s up to you to decide which tracks to drop and get the dance floor grooving! 🎉💃🎶')),
                Padding(padding: EdgeInsets.only(top: 20)),
                Align(alignment:Alignment.centerLeft, child: Text(textAlign: TextAlign.center,'📱 For Music Lovers:', style: TextStyle(fontWeight: FontWeight.w500))),
                Padding(padding: EdgeInsets.only(top: 10)),
                Align(alignment:Alignment.centerLeft, child: Text(textAlign: TextAlign.left,'As a music lover, you get to be part of the action too! Simply open the app and scan the DJ\'s QR code to dive into a world of musical delight. Search for your favorite songs, request them, and let the DJ know what gets you moving and grooving. Your music taste matters, and we want to make sure you have a blast at every event! 🎵🕺🎉')),
                Padding(padding: EdgeInsets.only(top: 40)),
                Align(alignment:Alignment.center, child: Text(textAlign: TextAlign.center,'Join us today and let\'s create some magical music moments together! 🎶🎉')),
                Padding(padding: EdgeInsets.only(top: 10)),
                Align(alignment:Alignment.center, child: Text(textAlign: TextAlign.center,'🌟 Happy partying and dancing! 🌟')),
              ]))
        ])
      )
    );}
}
