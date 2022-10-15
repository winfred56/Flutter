import 'package:flutter/material.dart';

class SocialMediaPhotosAndVideos extends StatefulWidget {
  const SocialMediaPhotosAndVideos({Key? key}) : super(key: key);

  @override
  State<SocialMediaPhotosAndVideos> createState() =>
      _SocialMediaPhotosAndVideosState();
}

class _SocialMediaPhotosAndVideosState
    extends State<SocialMediaPhotosAndVideos> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTq0-rVMpUtEv4hQFSmAwpjTs0k84ugiVRbpA&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                    left: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                    color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.favorite_border_outlined),
                          Text("2K", style:TextStyle(fontSize: 18))
                        ],
                      ),
                    ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzEUC0bHnQClp5gwhHQitChJWbTQdDdSsjl5MxOKvuDebdRjb6xwK035BhS_MBqTrXeJI&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("1.2K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7-oqaCJGyEh9naJxYjW0oo7N7ziO5ZnQsiw&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("2.6K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROKl1aPL-c1YqS8hfUgjT6fh6kfdd5Xg2Lbg&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("4.1K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGrawPy6XEiGx7uc2YfqnTc8AodeG0iDErEQ&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("2.7K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTs741r3DfVT2SSLAfoSQWmOJZWau45M6608g&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("3K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkcPeFOVknP8Wtj5ONur1RxOred2DlHhImcA&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("1.9K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxpCs9klb098t9eee1v5xFff5tIkjXqCRemg&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("2.2K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3byOWc0yDStDT7xUaXUWroQyXYH-9TcvTvg&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("4.8K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAX_ZAbzha1JnxKZPSFed26PA06wCthQpgww&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("12K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDToh1M731zc_6wDFPmbCWZSB4baGDixQ2hQ&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("9K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.27,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15), // Image border
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(48), // Image radius
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcU1g95uYiXhL4xq6FldwCm9lTw0xr-xc-Mw&usqp=CAU',
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 130,
                  left: 30,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.17,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.favorite_border_outlined),
                        Text("6.1K", style:TextStyle(fontSize: 18))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
      ],
    );
  }
}
