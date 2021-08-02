import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
