import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mission_ed/login_screen.dart';
import 'package:mission_ed/rounded_button.dart';
import 'constsnts.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String email;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfcfc),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          child: ListView(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ' Forget Password',
                    style: TextStyle(
                        color: Color(0xff312C69),
                        fontSize: 28.0,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 6.5,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: kDecoration),
                  SizedBox(
                    height: 16.0,
                  ),
                  RoundButton(
                    onPressed: () {
                      if (email == _auth.currentUser.email &&
                          !(_auth.currentUser.emailVerified)) {
                        _auth.sendPasswordResetEmail(email: email);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreen()));
                      } else {
                        SnackBar(
                          content: Text('Email does not exist'),
                          duration: Duration(seconds: 1),
                        );
                      }
                    },
                    colour: Color(0xff312C69),
                    text: 'Confirm',
                  ),
                ],
              ),
              SizedBox(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
