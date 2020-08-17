import 'package:flutter/material.dart';
import 'package:travel_craft_01/Screens/detail_screen.dart';
import 'package:upi_india/upi_india.dart';


class Payment extends StatefulWidget {
  static const routName = '/payment';
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

Future<UpiResponse> _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp> apps;

  @override
  void initState() {
    _upiIndia.getAllUpiApps().then((value) {
      setState(() {
        apps = value;
      });
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(String app, String _title, double _amt) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: '7338656198@ybl',
      receiverName: 'Travel Craft',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Trip to $_title, happy Journey.',
      amount: _amt,
    );
  }

  Widget displayUpiApps(String title, double amt) {
    if (apps == null)
      return Center(child: CircularProgressIndicator());
    else if (apps.length == 0)
      return Center(child: Text("No apps found to handle transaction."));
    else
      return Center(
        child: Wrap(
          children: apps.map<Widget>((UpiApp app) {
            return GestureDetector(
              onTap: () {
                _transaction = initiateTransaction(app.app, title,amt);
                setState(() {});
              },
              child: Container(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.memory(
                      app.icon,
                      height: 60,
                      width: 60,
                    ),
                    Text(app.name),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final routArg = ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final amount = routArg['amount'];
    final tName = routArg['title'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: ListView(
        children: <Widget>[
          displayUpiApps(tName,amount),
          FutureBuilder(
            future: _transaction,
            builder: (BuildContext context,
                AsyncSnapshot<UpiResponse> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(child: Text('An Unknown error has occured'));
                }
                UpiResponse _upiResponse;
                _upiResponse = snapshot.data;
                if (_upiResponse.error != null) {
                  String text = '';
                  switch (snapshot.data.error) {
                    case UpiError.APP_NOT_INSTALLED:
                      text = "Requested app not installed on device";
                      break;
                    case UpiError.INVALID_PARAMETERS:
                      text = "Requested app cannot handle the transaction";
                      break;
                    case UpiError.NULL_RESPONSE:
                      text = "requested app didn't returned any response";
                      break;
                    case UpiError.USER_CANCELLED:
                      text = "You cancelled the transaction";
                      break;
                  }
                  return Center(
                    child: Text(text),
                  );
                }
                String txnId = _upiResponse.transactionId;
                String resCode = _upiResponse.responseCode;
                String txnRef = _upiResponse.transactionRefId;
                String status = _upiResponse.status;
                String approvalRef = _upiResponse.approvalRefNo;
                switch (status) {
                  case UpiPaymentStatus.SUCCESS:
                    print('Transaction Successful');
                    break;
                  case UpiPaymentStatus.SUBMITTED:
                    print('Transaction Submitted');
                    break;
                  case UpiPaymentStatus.FAILURE:
                    print('Transaction Failed');
                    break;
                  default:
                    print('Received an Unknown transaction status');
                }
                return Center(
                  child: AlertDialog(
                    title: Text(status),
                    actions: [
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },)
                    ],
                  ),
                );
              } 
              else{
                return Text('');
              }
            },
          )
        ],
      ),
    );
  }
}