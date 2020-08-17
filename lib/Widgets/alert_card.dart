import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Models/notification_model.dart';

class NotifierCard extends StatefulWidget {
  final String title;
  final DateTime dateTime;

  NotifierCard({
    @required this.title,
    @required this.dateTime,
  });

  

  @override
  _NotifierCardState createState() => _NotifierCardState();
}

class _NotifierCardState extends State<NotifierCard> {

// @override
//   void initState() {
//     Provider.of<NotificationOffline>(context).init();
//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    var reminder = false;
// void reminderOnOff() {
// setState(() {
//   reminder = !reminder;
//   reminder == true ? Provider.of<NotificationOffline>(context, listen: false).sheduledNotification(widget.id, widget.title, widget.body, widget.dateTime) :
//   Provider.of<NotificationOffline>(context, listen: false).cancelNotification(widget.id);
// });
// }

    return Card(
     
      child: ListTile(
        title: Text(widget.title),
        
        leading:  CircleAvatar(child: Text(DateFormat.Hm().format(widget.dateTime)))  ,
        trailing: IconButton(
          icon: Icon(Icons.add_alert,
         color: reminder == true ? Colors.black : Colors.grey,
          ),
          onPressed:(){},
        ),
      ),
    );
    
  }
}