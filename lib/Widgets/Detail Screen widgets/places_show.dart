import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../Detail Screen widgets/places_card_view.dart';

class PlacesShow extends StatelessWidget {
  final String _did;
  PlacesShow(this._did);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints)
    {
      return 
        Card(
              color: Colors.white70,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                elevation: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Places',
                          style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                          ),
                          ),
                        ),
                    ),
                    
                  Container(
                     padding: EdgeInsets.all(2),
      margin: EdgeInsets.all(3),
      height: 250,
      width: constraints.maxWidth * 1,
                    child:StreamBuilder(
                      stream: Firestore.instance.collection('destination').document(_did).collection('places').snapshots(),
                      builder: (_, snapshot) {
                        if(snapshot.connectionState ==ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator(),);
                        }
                        
                        final cdata = snapshot.data.documents;
                       return ListView.builder(
                       scrollDirection: Axis.horizontal,
                        itemCount: cdata.length,
                        itemBuilder: (_, index)
                        {
                         return cdata == null ? Center(child: Text('No Hotels Added yet!!'),): PlacesCardView(
                             titleImage: cdata[index]['poster'],
                             titleName: cdata[index]['name'],
                             descrip: cdata[index]['description'],
                           );
                        }
                        );
                      }
                      )
                    ),
                  ],
                ),
                );
      
    }
    );
  }
}