import 'package:flutter/material.dart';

import '../description_widget.dart';

class PlacesCardView extends StatelessWidget {
  final String titleImage, titleName, descrip;
  PlacesCardView({
    @required this.titleImage,
    @required this.titleName,
    @required this.descrip
  });
  @override
  Widget build(BuildContext context) {
     return ClipRRect(    
          borderRadius: BorderRadius.circular(20),
           child: Card(
         margin: EdgeInsets.all(5),
         elevation: 5,
          child: SingleChildScrollView(
                      child: Container(
              width: 223,
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
                  width: 210,
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
                  child: DescriptionWidget(descrip),
                )
              ],
        ),
            ),
          )
        )
          );
  }
}