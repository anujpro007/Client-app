import 'package:flutter/material.dart';
import 'package:travel_craft_01/Screens/alerts_screen.dart';
import 'package:travel_craft_01/Screens/home_screen.dart';
import 'package:travel_craft_01/Screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
final List<Widget> _pages=[
HomeScreen(),
NotificationAlerts(),
ProfilePage(),
];
int _selectedpageIndex = 0;

void _selectpage(int index){
setState(() {
  _selectedpageIndex = index;
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedpageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        backgroundColor: Theme.of(context).primaryColor,
        selectedIconTheme: IconThemeData(
          color: Colors.lightBlue[600],
          size: 35
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.blueGrey,
          size: 35
        ),
        currentIndex: _selectedpageIndex,
        selectedItemColor: Colors.lightBlue[600],
        items: [
            BottomNavigationBarItem(
            icon: Icon(Icons.flight_takeoff),
            title: Text('Home')
            ),
             BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('History')
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Profile')
            ),
            ],
        ),
    );
  }
}
