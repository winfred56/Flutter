import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class NotificationListItem extends StatefulWidget {
  const NotificationListItem({
    Key? key,
    required this.title,
    required this.time,
    required this.image,
    required this.read
  }) : super(key: key);

  final String title;
  final String  time;
  final String  image;
  final bool read;

  @override
  State<NotificationListItem> createState() => _NotificationListItemState();
}

class _NotificationListItemState extends State<NotificationListItem> {


  late bool messageRead = widget.read;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        setState((){
          messageRead = !messageRead;
        });
      },
      tileColor: messageRead ? Colors.white : HexColor('#9ea79e'),
      title: Text(widget.title, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(widget.time),
      leading: CircleAvatar(
        radius: 25  ,
        backgroundImage: NetworkImage(widget.image),
      ),
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.only(
      //     topLeft: Radius.circular(50),
      //   ),
      // ),
    );
  }
}
