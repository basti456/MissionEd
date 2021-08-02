import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mission_ed/constants.dart';
class Message extends StatefulWidget {

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('⚡️Chat Room'),
        backgroundColor: Color(0xff312C69),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                         message= value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageTextController.clear();
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
