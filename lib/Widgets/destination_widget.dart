
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


import './card_view.dart';

class DestinationWidget extends StatelessWidget {
 final String _topicName;
 DestinationWidget(this._topicName);
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
                          child: Text(_topicName,
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
                      stream: Firestore.instance.collection('destination').where('topic' , isEqualTo: _topicName).snapshots(),
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
                           return CardView(
                             did: cdata[index].documentID,
                             titleName: cdata[index]['name'],
                             titleImage: cdata[index]['image'],
                             price: cdata[index]['price'],
                             day: cdata[index]['days/nights']['days'],
                             night: cdata[index]['days/nights']['nights'],
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

