import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendNotification {
  Future<void> sendPostNotification(notificationTitle, sendersName, message,String id,
      notificationType, String topic) async {
    final data = jsonEncode(<String, dynamic>{
      "notification": {
        "body": "$message",
        "title": "$notificationTitle",
      },
      "priority": "high",
      "data": <String, String>{
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": id,
        "status": "done",
        "type": "$notificationType",
        "sendersUserId": "$sendersName",
      },
      "to": '/topics/$topic',
    });

    final headers = <String, String>{
      'content-type': 'application/json',
      'Authorization':
          'key=AAAAsEWVmyY:APA91bHec56YMfUXYPopN_96kVpDIS8tjbITbo7qfccYDijakzeU0x2-worqN9dvE8ddrhUZUViLh7XgRGLhOO9INHxD0rmPBun7BtFrheBfN_GTedISH-LYQy34yAlmLmQxh6KgWW5S'
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

  Future<void> sendDtoDNotification(notificationTitle, message,
      notificationType, var tokens, String s) async {
    // debugPrint('token : $token');

    final data = jsonEncode(<String, dynamic>{
      "notification": {
        "body": "$message",
        "title": "$notificationTitle",
      },
      "priority": "high",
      "data": <String, String>{
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
        "type": "$notificationType",
      },
      "to":
          'csonMGODTymsMPbeWcx6m5:APA91bEPyVCRXdtdWi4jQOKsv20n-pdts1KI6xLZA2S0LwA-bobDFniQGWX0YWxxSzLcsRfs3xhoPTb0feDNOKWnDMmIwjL4JPsmxOdxEhUdKVtzLOdR3BU5xhzuHCRKKq6We9Z9EE1R',
    });
    // print(topic);
    final headers = <String, String>{
      'content-type': 'application/json',
      'Authorization':
          'key=	AAAAsEWVmyY:APA91bHec56YMfUXYPopN_96kVpDIS8tjbITbo7qfccYDijakzeU0x2-worqN9dvE8ddrhUZUViLh7XgRGLhOO9INHxD0rmPBun7BtFrheBfN_GTedISH-LYQy34yAlmLmQxh6KgWW5S'
    };

    final url = 'https://fcm.googleapis.com/fcm/send';
    try {
      final response =
          await http.post(Uri.parse(url), headers: headers, body: data);

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
  Future<String> getToken() async {
    String token = await FirebaseMessaging.instance.getToken();
    return token;
  }
}


