import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './des_show_ratings.dart';
import './icon_detils.dart';

class PrimaryDetails extends StatelessWidget {
  final String titleName,did;
  final int price, days,nights;
  final Function showMore;
  PrimaryDetails({
    @required this.titleName,
    @required this.did,
    @required this.price,
    @required this.days,
    @required this.nights,
    @required this.showMore
  });
  @override
  Widget build(BuildContext context) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
              IconDetails(days, nights),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
        children: [
          Icon(Icons.location_on,
          size: 40,
          color: Colors.white,
          ),
          Text(titleName,
          style: GoogleFonts.acme(
          fontSize: 40,
          color: Colors.white
          ),
          ),
        ],
                  ),
        ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: DesShowRatings(did),
         ),   
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Row(
           children: [
                   Text('Starts from ',
                   style: TextStyle(color: Colors.amber[200]),
                   ),
                   SizedBox(width: 10,),
                   Text('₹$price',
                   style: TextStyle(
         color: Colors.white,
         fontWeight: FontWeight.bold,
         fontSize: 30),
                   )
           ],
           ),
         ),
         Container(
           margin: EdgeInsets.only(left: 130, top: 30),
           padding: EdgeInsets.all(8),
           child: RaisedButton(
           child: Column(children: [
                   Icon(Icons.keyboard_arrow_up,
                   color: Colors.white,
                   ),
                   Text('Show More',
                   style: TextStyle(color: Colors.white,
                   fontWeight: FontWeight.bold
                   ),
                   )
           ],),
           onPressed: showMore,
           color: Colors.transparent,
                  elevation: 20,
           ),
         )
        ],
                  );
  }


}