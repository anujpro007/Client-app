import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_craft_01/Screens/payment_screen.dart';



class BookingScreen extends StatefulWidget {
static const routName = '/book_screen';

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  double _totalAmt = 0;
int  _famCount = 0;


  @override
  Widget build(BuildContext context) {
    
    final routArg = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final id = routArg['id'];
    final title = routArg['title'];
    return Scaffold(
      appBar: AppBar(title: Text('Booking'),
      ),
      body: ListView(children: [
        Text(title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30
        ),
        ),
        StreamBuilder(
          stream: Firestore.instance.collection('destination').document(id).snapshots(),
          builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            final price = snapshot.data;
                return Column(
                  children: [
                    Card(
                    child: Column(
                      children: [
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Members'),
            ),
           _famCount == 0 ? IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: (){
                              setState(() {
                                _famCount ++ ;
                                
                              });
                             
                            },
                            ): Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.add_circle),
                                  onPressed: (){
                                    setState(() {
                                _famCount ++ ;
                                
                              });
                              
                                  },
                                ),
                                SizedBox(width: 2,),
                                Text(_famCount.toString(),style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                SizedBox(width: 2,),
                                IconButton(
                                  icon: Icon(Icons.remove_circle),
                                  onPressed: (){
                                    setState(() {
                                      _famCount --;
                                      
                                    });
                                     
                                  },
                                ),
                              ],
                            ),
                           ],
                        ),
                        
                        SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(left: 50, right: 50),
                        child: Text('$_famCount x ${price['member'].toString()} = ${(_totalAmt =  _famCount.toDouble() * price['member']).toString()}'),
                        )
                      ],
                    ),
                    ),
                    SizedBox(height: 20,),
        Card(
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Total    ='),
              Text(_totalAmt.toString())
            ],),),
            SizedBox(height: 50,),
            RaisedButton(
              child: Text('Pay'),
              onPressed:(){
                Navigator.of(context).pushNamed(Payment.routName, arguments: {
                  'amount' : _totalAmt,
                  'title' : title
                });
              },
            ),
                  ],
                );
          },
        ),
        
      ],),
      );
  }
}