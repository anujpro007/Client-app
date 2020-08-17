import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_craft_01/Models/notification_model.dart';
import 'package:travel_craft_01/Widgets/bottom_nav_bar.dart';

import './Screens/detail_screen.dart';
import './Screens/booking_screen.dart';
import 'Screens/payment_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: NotificationOffline(),
          child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
           primaryColor: Colors.white,
           primarySwatch: Colors.lightBlue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
        //   home: NotificationAlerts(),
          initialRoute: '/',
         routes: {
           '/' : (ctx)=> BottomNavBar(),
           DetailScreen.routeName : (ctx)=> DetailScreen(),
           BookingScreen.routName : (ctx)=> BookingScreen(),
           Payment.routName : (ctx)=> Payment()
         },
        ),
    );
  }
}

