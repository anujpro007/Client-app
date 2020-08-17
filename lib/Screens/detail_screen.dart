import 'package:flutter/material.dart';

import '../Widgets/Detail Screen widgets/detail_app_bar.dart';
import '../Widgets/Detail Screen widgets/primary_details.dart';
import '../Screens/dest_detail_popup.dart';


class DetailScreen extends StatefulWidget {
  static const routeName = '/detail-screen';
  

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _showMoreFlag = false;
  @override
  Widget build(BuildContext context) {
    final routArg = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _did = routArg['id'];
    final _titleName = routArg['title'];
    final _poster = routArg['poster'];
    final _price = routArg['price'];
    final _days = routArg['day'];
    final _nights = routArg['night'];

    void _showMore(){
      setState(() {
        _showMoreFlag = !_showMoreFlag;
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 1,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image.network(_poster)),
          ),
          SingleChildScrollView(
                      child: Column(
                    children: [
                      Padding(
            padding: const EdgeInsets.only(top:35.0),
            child: DetailAppBar(
              showMore: _showMoreFlag,
              titleName: _titleName,
            ),
                      ),
                      _showMoreFlag ?  DestDetailPopup(_did, _titleName)
               : Container(
                height: MediaQuery.of(context).size.height * 0.36,
                 width: double.infinity,
                 margin: EdgeInsets.only(top: 484.2),
                 decoration: BoxDecoration(
                 gradient: LinearGradient(
                 colors: [Colors.black12,Colors.black54,Colors.black54, Colors.black],
              begin: Alignment.topCenter,
                   end: Alignment.bottomCenter,
                         )
                    ),
                child:  PrimaryDetails(
                  titleName: _titleName,
                  did: _did,
                  price: _price,
                  days: _days,
                  nights: _nights,
                  showMore: _showMore,
                ),
                ),
                    ],
                  ),
          ),     
        ],
      ),
    );
  }
}