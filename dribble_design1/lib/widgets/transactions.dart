import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              border: Border.all(width: 0.6, color: Colors.black12)
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.14,
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                    color: Colors.brown,
            ),
                    child: const Center(
                      child: Text(
                        '🍔',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 8),),
                const Text('Fast Food', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const Text('\$450.00', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                border: Border.all(width: 0.6, color: Colors.black12)
            ),
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Text(
                        '🥦',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 8),),
                const Text('Grocery', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const Text('\$1250.00', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                border: Border.all(width: 0.6, color: Colors.black12)
            ),
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal,
                    ),
                    child: const Center(
                      child: Text(
                        '🛍',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 8),),
                const Text('Shopping', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const Text('\$4200.00', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                border: Border.all(width: 0.6, color: Colors.black12)
            ),
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange,
                    ),
                    child: const Center(
                      child: Text(
                        '🎂',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 8),),
                const Text('cakes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const Text('\$150.00', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                border: Border.all(width: 0.6, color: Colors.black12)
            ),
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: const Center(
                      child: Text(
                        '🎷',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 8),),
                const Text('Music', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const Text('\$40.00', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
          Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
                border: Border.all(width: 0.6, color: Colors.black12)
            ),
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.14,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        '🎳',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                const Padding(padding: EdgeInsets.only(top: 8),),
                const Text('Games', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                const Text('\$100.00', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
        ],
      ),
    );
  }
}
