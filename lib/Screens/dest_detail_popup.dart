import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Widgets/Detail Screen widgets/des_show_ratings.dart';
import '../Widgets/Detail Screen widgets/book_button.dart';
import '../Widgets/description_widget.dart';
import '../Widgets/Detail Screen widgets/places_show.dart';
import '../Widgets/Detail Screen widgets/show_hotel_cards.dart';
import '../Screens/booking_screen.dart';


class DestDetailPopup extends StatelessWidget {
final String _did, titleName;
DestDetailPopup(this._did, this.titleName);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
      decoration: BoxDecoration
      (
        borderRadius: BorderRadius.circular(30),
      color: Colors.white
      ),
      height: MediaQuery.of(context).size.height * 0.88,
      margin: EdgeInsets.all(10),
      child: ListView(children: [
        Padding(padding: EdgeInsets.only(left: 12, right: 12),
        child: StreamBuilder(
          stream: Firestore.instance.collection('destination').document(_did).collection('Details').document('description').snapshots(),
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            return DescriptionWidget(snapshot.data['title']);
          },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10,bottom: 10),
          child: DesShowRatings(_did),
          ),
         PlacesShow(_did),
        ShowHotelCards(_did)
      ],),
    ),

    //Button for booking//
    Positioned(
      bottom: 15,
      left: 100,
      child: BookButton(
        ()=>  Navigator.of(context).pushNamed(BookingScreen.routName, arguments: {
            'id' : _did,
            'title' : titleName
          })
      )
      )
      ],
    ); 
  }
}