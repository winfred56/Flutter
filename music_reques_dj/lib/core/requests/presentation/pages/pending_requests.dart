import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PendingRequestsPage extends StatefulWidget {
  const PendingRequestsPage({Key? key}) : super(key: key);

  @override
  State<PendingRequestsPage> createState() => _PendingRequestsPageState();
}

class _PendingRequestsPageState extends State<PendingRequestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''), centerTitle: true),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(children: [
          Slidable(
              key: const ValueKey(0),
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                    onPressed: (context){},
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    icon: Icons.verified,
                    label: 'Accept'
                )
              ]
            ),
            startActionPane: ActionPane(
              motion:  const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {
                /// Delete Item
              }),
              children: [
                SlidableAction(
                  onPressed: (context){},
                  backgroundColor: const Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: 'Delete'
                )
              ]),
              child: const ListTile(
                  leading: Image( image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfVJUVmtYK9sIoJc3zEhwCEIgFdmdK2TK6dw&usqp=CAU')),
                  title: Text('dsvvjdvasj'),
                  subtitle: Text('dsvvjd'),
                  isThreeLine: true
              )
          )

        ])
      )
    );
  }
}
