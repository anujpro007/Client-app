import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailAppBar extends StatelessWidget {
 final bool showMore;
  final String titleName;
  DetailAppBar({@required this.showMore, @required this.titleName});
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
        IconButton(
          icon: Icon(Icons.arrow_back_ios,
          size: 30,
          color: Colors.white,
          ),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        SizedBox(width: 20,),
        showMore == true ?
        Text(titleName,
        style: GoogleFonts.acme(
          fontSize: 35,
          color: Colors.white
        ),
        ): Text(''),
                  ],);
  }
}