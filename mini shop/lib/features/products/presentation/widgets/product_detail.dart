import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart_rounded,
                    size: 34,
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  /// Item Image
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: const Image(
                      image: NetworkImage(
                          'https://assets.stickpng.com/thumbs/580b57fbd9996e24bc43befa.png'),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                ],
              ),
            ),
            const Text('Summer Dress', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28),),
            const Text('\$80.00', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w300, fontSize: 28),),
            const Padding(padding: EdgeInsets.symmetric(vertical: 50)),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.076,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30)
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.black87,
            ),
            //minimumSize:
          ),
          onPressed: () async {},
          child: const Text(
            "Add to Cart 🛒",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
