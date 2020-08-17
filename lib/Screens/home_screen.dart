import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:travel_craft_01/Widgets/carousel_widget.dart';
import 'package:travel_craft_01/Widgets/notification_widget.dart';
import 'package:travel_craft_01/Widgets/topic_view.dart';

class HomeScreen extends StatelessWidget {
  final appBar = AppBar(
        title: Padding(
                   padding: const EdgeInsets.only(top: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Welcome to',
                       style: TextStyle(
                         fontSize: 15,
                         fontWeight: FontWeight.bold
                       ),
                       ),
                       Text('Travel Craft',
                          style: GoogleFonts.doHyeon(
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                          ),
                      ),
                     ],
                   ),
                 ),
                   elevation: 0,
                //  actions: [
                //    Padding(
                //      padding: const EdgeInsets.all(8.0),
                //      child: Icon(Icons.account_circle,
                //      size: 35,
                //      ),
                //    )
                //  ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Stack(
        children: [
          Stack(
                children:[
                  Container(
              height: (MediaQuery.of(context).size.height - 
              appBar.preferredSize.height- 
              MediaQuery.of(context).padding.top) *  0.75,
              margin: EdgeInsets.only(top:120),
              child: Carousel(),
              width: double.infinity,
              ),
              Container(
                // margin: EdgeInsets.only(top:100),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                           gradient: LinearGradient(
                             colors: [Colors.white10,Colors.white,Colors.white,Colors.white],
                             begin: Alignment.bottomCenter,
                             end: Alignment.topCenter,
                           )
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.all(25),
                                 child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Text('Where You',
                                  style: GoogleFonts.righteous(
                                    fontSize: 30,
                                  )
                                  ),
                                  Text('want to go?',
                                  style: GoogleFonts.righteous(
                                    fontSize: 30,
                                  )
                                  ),
                                  ],
                                 ),
                               ),
                             ],
                           ),
              ),
              Container(
                color: Colors.transparent,
               margin: EdgeInsets.only(top: 120),
               child: ListView(
                 children: [
                   Container(
                     height: 350,
                     color: Colors.transparent,
                   ),
                   TopicView()
                 ],
               ),
              )
                ] 
          ),
            
        ],
      ),
     
    );
  }
}