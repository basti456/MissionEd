import 'package:flutter/material.dart';
import 'package:mission_ed/rounded_button.dart';

import 'constsnts.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
                      decoration: kDecoration),

                  SizedBox(
                    height: 16.0,
                  ),
                  RoundButton(
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
