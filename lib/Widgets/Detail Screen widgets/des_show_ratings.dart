import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../show_ratings.dart';

class DesShowRatings extends StatelessWidget {
  final String did;
  DesShowRatings(this.did);
  @override
  Widget build(BuildContext context) {
     return StreamBuilder(
            stream: Firestore.instance.collection('destination').document(did).collection('Details').document('description').snapshots(),
            builder: (_, snapi){
                if(snapi.connectionState == ConnectionState.waiting && snapi.hasData == null){
      return Center(child: CircularProgressIndicator(),);
                }
                return  Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
                ShowRating(
      rating: snapi.data['stars'].toDouble(),
                ),
                SizedBox(width: 10,),
                Text('${snapi.data['stars'].toString()}(${snapi.data['raters'].toString()})',
                style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.green[800],
                fontSize: 20
                ),
                )
        ],
        )  ;   
            },
            );
  }
}
