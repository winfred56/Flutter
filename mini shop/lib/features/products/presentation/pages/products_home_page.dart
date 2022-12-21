import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class ProductsHomePage extends StatefulWidget {
  const ProductsHomePage({Key? key}) : super(key: key);

  @override
  State<ProductsHomePage> createState() => _ProductsHomePageState();
}

class _ProductsHomePageState extends State<ProductsHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const CircleAvatar(
                  radius: 30,
                ),
                IconButton(
                    onPressed: () async {},
                    icon: const Icon(
                      Icons.shopping_cart_rounded,
                      size: 34,
                    )),
              ]),
              const Padding(padding: EdgeInsets.only(top: 10)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(
                          label: const Text(
                            'Shoes 👟',
                          ),
                          onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(
                          label: const Text(
                            'Bags 👜',
                          ),
                          onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(
                          label: const Text(
                            'Shirts 👕',
                          ),
                          onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(
                          label: const Text(
                            'Jeans 👖',
                          ),
                          onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(
                          label: const Text(
                            'Beach 🏖',
                          ),
                          onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(
                          label: const Text(
                            'Accessories 🕶',
                          ),
                          onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(
                          label: const Text(
                            'Street wear 🧥',
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 10)),
              CarouselSlider(
                items: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Image(
                      image: NetworkImage(
                          'https://assets.stickpng.com/thumbs/5a1c3e09f65d84088faf1447.png'),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Image(
                      fit: BoxFit.fitHeight,
                      image: NetworkImage(
                          'https://assets.stickpng.com/thumbs/580b585b2edbce24c47b2911.png'),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.brown.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Image(
                      image: NetworkImage(
                          'https://assets.stickpng.com/thumbs/585990814f6ae202fedf28d6.png'),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Image(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                        'https://assets.stickpng.com/thumbs/6160571a76000b00045a7d9e.png',
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Dresses 👗',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43befa.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43befb.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43bef1.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43bef3.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Shoes 👟',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.brown.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43bf4c.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.brown.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43bf83.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.brown.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/5895fd98cba9841eabab60a4.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.brown.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/62ecfbfd368f9d14562de6a7.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Jackets 🧥',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43bf2c.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43bf31.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43bf30.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, '/products_details'),
                        child: Column(
                          children: [
                            /// Item Image
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Image(
                                image: NetworkImage(
                                    'https://assets.stickpng.com/thumbs/585680404f6ae202fedf26f0.png'),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),

                            /// Item Name and Price
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Short Dress             ',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black87)),
                                Text('\$80',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
