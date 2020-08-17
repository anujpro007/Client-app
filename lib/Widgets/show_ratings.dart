import 'package:flutter/material.dart';

class ShowRating extends StatelessWidget {
  final int starCount;
  final double rating;

  ShowRating({this.starCount = 5, this.rating = .0});


Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Colors.yellow[700],
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: Colors.yellow[700] ?? Colors.white,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: Colors.yellow[700] ?? Colors.white,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}