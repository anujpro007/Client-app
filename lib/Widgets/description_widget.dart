import 'package:flutter/material.dart';

class DescriptionWidget extends StatefulWidget {
  final String text;

  DescriptionWidget(this.text);
  @override
  _DescriptionWidgetState createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
  String firstHalf, secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if(widget.text.length > 30){
      firstHalf = widget.text.substring(0, 30);
      secondHalf = widget.text.substring(30, widget.text.length);
    }
    else{
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty ?
        Text(firstHalf) :
        Column(
          children: [
            Text(flag ? firstHalf + '...' : firstHalf + secondHalf),
              InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        flag ? "show more" : "show less",
                        style: new TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            )
        );
  }
}