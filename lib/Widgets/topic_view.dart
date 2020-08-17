import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './destination_widget.dart';

class TopicView extends StatelessWidget {
  const TopicView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('topics').snapshots(),
      builder: (ctx, tSnapshot) {
        if(tSnapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        var tData = tSnapshot.data.documents;
        return Column(
          children: tData.map((DocumentSnapshot document) {
              return DestinationWidget(
                document['topic']
              );
          }).toList(),
        );
      }
    );
  }
}