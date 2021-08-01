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
    "data": {
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "id": "1",
      "status": "done",
      "type": "$notificationType",
      "sendersUserId": "$sendersName",
    },
    "to": "$topic",
  });

  final headers = {
    'content-type': 'application/json',
    'Authorization':
        'key=AAAAsEWVmyY:APA91bFKBkB_9kNtFmDW6rEBtNcJUfuQ7CjwoMC3pzbTDhaIiiea0E2_3VHfSm3LfgPYs9h696nzfxccd9gJRsNIPriZ0PIrjxSRKJlUITxYTGJCXdWD4L7UJ_AkWstatnZZuoXgSEpA'
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
