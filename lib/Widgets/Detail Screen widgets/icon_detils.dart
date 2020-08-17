import 'package:flutter/material.dart';

class IconDetails extends StatelessWidget {
  final int _days, _nights;
  IconDetails(this._days, this._nights);
  @override
  Widget build(BuildContext context) {
   return Row(
                  children: [
                  Padding(
        padding: const EdgeInsets.only(left:8.0, top: 10),
        child: Icon(Icons.wb_sunny,
        color: Colors.yellow,
        ),
                  ),
                  Padding(
        padding: const EdgeInsets.only(left:8.0, top: 10),
        child: Text('${_days.toString()} days',
        style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.white
        ),
        ),
                  ),
                  SizedBox(width: 30,),
                  Padding(
        padding: const EdgeInsets.only(left:8.0, top: 10),
        child: Icon(Icons.brightness_2,
        color: Colors.black
        ),
                  ),
                  Padding(
        padding: const EdgeInsets.only(left:8.0, top: 10),
        child: Text('${_nights.toString()} Nights',
        style: TextStyle(fontWeight: FontWeight.bold,
        color: Colors.white
        ),
        ),
                  ),
                  Padding(
        padding: const EdgeInsets.only(left:8.0, top: 10),
        child: Icon(Icons.directions,
        color: Colors.grey[50]
        ),
                  )
              ],);
  }
}