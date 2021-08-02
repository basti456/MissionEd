
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendNotification{
  Future<void> sendPostNotification(notificationTitle, sendersName, message,
      notificationType, String topic) async {
    final data = jsonEncode(<String,dynamic>{
      "notification": {
        "body": "$message",
        "title": "$notificationTitle",
      },
      "priority": "high",
      "data":<String, String> {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
        "type": "$notificationType",
        "sendersUserId": "$sendersName",
      },
      "to": "$topic",
    });

    final headers =<String, String> {
      'content-type': 'application/json',
      'Authorization':
      'key=AAAA6cFyXKs:APA91bGjKAz_5qu4oacqwcrvL_7--D2buLUGPQrVcbTG8y5TtolqCbbZUrlj5Fa8lQ5MgIzFJcD94w-cZbibJdJ9aRr7Y7ClTZgqMtZxv2nKwxIkxyB6sbvJoPDjXPuBXY8eOgFczOUM'
    };

    final url = 'https://fcm.googleapis.com/fcm/send';
    try {
      final response =
      await http.post(Uri.parse(url), headers: headers, body: data);

      if (response.statusCode == 200) {
        print('message sent');
      } else {
        print('notification sending failed');
      }
    } catch (e) {
      debugPrint('exception $e');
    }
  }
  Future<void> sendDtoDNotification(
      notificationTitle, message, notificationType,  var tokens, String s) async {
    // debugPrint('token : $token');

    final data =jsonEncode(<String,dynamic> {
      "notification": {

        "body": "$message",
        "title": "$notificationTitle",
      },
      "priority": "high",
      "data":<String, String> {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
        "type": "$notificationType",

      },
      "to":'c3e92foqTr66cEKCDia2Ei:APA91bH3V3A_E1_9MKYIGH_WFWvUF2Oiaf__zXpCPgQ7dRRtCIzCTQhz70-zF5FVIl4FFyN6F-BdmH1nGJOcdKfk25YuHtDBe5u_f1G98o5pqk2JAW-VlHJEqsVUFTFaFgyLQP_NBvBj',

    });
    // print(topic);
    final headers = <String, String>{
      'content-type': 'application/json',
      'Authorization':
      'key=AAAA6cFyXKs:APA91bGjKAz_5qu4oacqwcrvL_7--D2buLUGPQrVcbTG8y5TtolqCbbZUrlj5Fa8lQ5MgIzFJcD94w-cZbibJdJ9aRr7Y7ClTZgqMtZxv2nKwxIkxyB6sbvJoPDjXPuBXY8eOgFczOUM'
    };


    final url = 'https://fcm.googleapis.com/fcm/send';
    try {
      final response = await http.post(Uri.parse(url), headers: headers, body: data);

      if (response.statusCode == 200) {
        print('message sent');
      } else {
        print('notification sending failed');
        // on failure do sth
      }
    } catch (e) {
      print(e);
      // debugPrint('exception $e');
    }
  }
}