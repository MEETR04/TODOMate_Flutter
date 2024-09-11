//sending local notifications from Firebase
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> onBackgroundMessage(RemoteMessage message) async {
  print('Title : ${message.notification?.title}');
  print('Body : ${message.notification?.body}');
  print('Payload : ${message.data}');
}

class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final token = await _firebaseMessaging.getToken();
    print("token is $token");
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
  }


}
