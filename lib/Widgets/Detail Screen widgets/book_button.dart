import 'package:flutter/material.dart';

class BookButton extends StatelessWidget {
  final Function bookAction;
  BookButton( this.bookAction);
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50,
      minWidth: 200,
            child: RaisedButton(
              elevation: 10,
        color: Colors.green[400],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: Colors.white)
        ),
        child: Text('Book',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30
          ),
        ),
        onPressed: bookAction,
        ),
    );
  }
}