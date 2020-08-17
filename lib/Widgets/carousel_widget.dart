import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('New').snapshots(), 
      builder: (ctx, cSnaphot) {
        if(cSnaphot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        final cData = cSnaphot.data.documents;
        return CarouselSlider.builder(
            itemCount: cData.length, 
            itemBuilder: (_, index) =>
           Container(  
             height: double.infinity,                                                                           
            child: Image.network(cData[index]['image'], 
            fit: BoxFit.fill,),
            // margin: EdgeInsets.symmetric(horizontal: 5, vertical: 20)
            width: double.infinity,
          ),
             options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 0.7,
               viewportFraction: 1,
                // enlargeCenterPage: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                // autoPlayCurve: Curves.fastOutSlowIn,
                
          )
             );
      },
            );
  }
}