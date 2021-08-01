import 'package:flutter/material.dart';
import 'package:mission_ed/rounded_button.dart';

import 'constsnts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfcfc),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          child: ListView(

            children: [
              SizedBox(height: 40.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    ' Change Password',
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
                      decoration: kDecoration.copyWith(
                        prefixIcon: Icon(Icons.vpn_key_outlined),
                        hintText: 'old password',
                      )
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  TextField(
                      decoration: kDecoration.copyWith(
                        prefixIcon: Icon(Icons.vpn_key_outlined),
                        hintText: 'new password',
                      )
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  TextField(
                      decoration: kDecoration.copyWith(
                        prefixIcon: Icon(Icons.vpn_key_outlined),
                        hintText: 'confirm new password',
                      )
                  ),

                  SizedBox(
                    height: 16.0,
                  ),
                  RoundButton(
                    colour: Color(0xff312C69),
                    text: 'Confirm',
                  ),


                ],
              ),
              SizedBox(height: 120,),





            ],
          ),
        ),
      ),
    );
  }
}
