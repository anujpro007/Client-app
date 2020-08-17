import 'package:flutter/material.dart';

import '../Screens/detail_screen.dart';

class CardView extends StatelessWidget {
  final String titleImage;
  final String titleName;
  final int price;
  final String did;
  final int day, night;

  CardView({
    @required this.titleImage, 
  @required this.titleName,
   @required this.price, 
   @required this.did,
   @required this.day,
    @required this.night
    });

  void onTapAction(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      DetailScreen.routeName, arguments: {
        'id': did,
        'title': titleName,
        'poster': titleImage,
        'price' : price,
        'day' :day,
        'night' : night
      });
  }

  @override
  Widget build(BuildContext context) {
      return ClipRRect(    
        borderRadius: BorderRadius.circular(20),
         child: GestureDetector(
           onTap: () =>onTapAction(context),
                    child: Card(
              margin: EdgeInsets.all(5),
              elevation: 5,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   margin: EdgeInsets.only(top: 5,left: 6, right: 5),
                   child: ClipRRect(       
                     borderRadius: BorderRadius.circular(20),
                     child: Image.network(titleImage,
                     fit: BoxFit.fill,
                     ),
                   ),
                   height: 130,
                   width: 150,
                 ),
                 SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.only(left: 10),
                   child: Text(titleName,
                   style: TextStyle(fontWeight: FontWeight.bold),
                   ),
                 ),
                //  SizedBox(height: 5,),
                 Padding(
                   padding: EdgeInsets.all(10),
                   child: Text('Starts from${price.toString()}'),
                 )
               ],
             )
             ),
         )
        );
    }
    
  }
