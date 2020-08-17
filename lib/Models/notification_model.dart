import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';



class NotificationOffline extends ChangeNotifier{

 static final _notification = FlutterLocalNotificationsPlugin();

NotificationOffline(){
   init();
}

 Future<void> init() async{
  await _notification.initialize(
    InitializationSettings(
      AndroidInitializationSettings('mipmap/ic_launcher'),
      IOSInitializationSettings()
      ),
      // onSelectNotification: (payload) {},
      );
}



  Future<void> cancelNotification(int id) async {
     
    _notification.cancel(id);} 
  
  Future<void> sheduledNotification(
    int _id,
  String _title,
  String _body,
  DateTime _dateTime
) async{
  // var scheduledNotificationDateTime =
  //       DateTime.parse(_dateTime);
var androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your other channel id',
        'your other channel name', 'your other channel description',
        importance: Importance.High);
var iOSPlatformChannelSpecifics =
    IOSNotificationDetails();
NotificationDetails platformChannelSpecifics = NotificationDetails(
    androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
await _notification.schedule(
    _id,
    _title,
    _body,
    _dateTime,
    platformChannelSpecifics,
    payload: _title,
    androidAllowWhileIdle: true
    );
}


}