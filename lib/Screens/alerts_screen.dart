import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travel_craft_01/Widgets/alert_card.dart';


class NotificationAlerts extends StatefulWidget {
  @override
  _NotificationAlertsState createState() => _NotificationAlertsState();
}

class _NotificationAlertsState extends State<NotificationAlerts> {

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Alerts!'),
    );
    return Scaffold(
      appBar: appBar,
      body: StreamBuilder(
        stream: Firestore.instance.collection('destination').document('1260jmuUrpjtXtezWOEm').collection('alerts').snapshots(),
        builder: (_, snaphot){
          if(snaphot.connectionState == ConnectionState.waiting){
            return Center(child: Text('Loading...'),);
          }
          final nData = snaphot.data.documents;
          return ListView.builder(
            itemCount: nData.length,
            itemBuilder: (ctx, index){
              return NotifierCard(
               
                dateTime: nData[index]['createdAt'].toDate(),
                title: nData[index]['text'],
              );
            });
        },
        ),
      
    );
  }
}

