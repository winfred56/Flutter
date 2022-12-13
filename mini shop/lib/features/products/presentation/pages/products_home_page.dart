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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    radius: 30,
                  ),
                  IconButton(
                      onPressed: () {},
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
                      child: ActionChip(label: const Text('Shoes 👟',), onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(label: const Text('Bags 👜',), onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(label: const Text('Shirts 👕',), onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(label: const Text('Jeans 👖',), onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(label: const Text('Beach 🏖',), onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(label: const Text('Accessories 🕶',), onPressed: () {}),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ActionChip(label: const Text('Street wear 🧥',), onPressed: () {}),
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
