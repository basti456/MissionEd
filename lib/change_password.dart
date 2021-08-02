import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mission_ed/login_screen.dart';
import 'package:mission_ed/rounded_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'constants.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  String oldPassword;
  String newPassword;
  String confirmNewPassword;
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  Future<bool> validatePassword(String password) async {
    var firebaseUser = _auth.currentUser;
    var authCredential = EmailAuthProvider.credential(
        email: _auth.currentUser.email, password: password);
    var authResult =
        await firebaseUser.reauthenticateWithCredential(authCredential);
    return authResult.user != null;
  }

  Future<void> updatePassword(String password) async {
    var firebaseUser = _auth.currentUser;
    await firebaseUser.updatePassword(newPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfcfc),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
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
                        obscureText: true,
                        onChanged: (value) {
                          oldPassword = value;
                        },
                        decoration: kDecoration.copyWith(
                          prefixIcon: Icon(Icons.vpn_key_outlined),
                          hintText: 'old password',
                        )),
                    SizedBox(
                      height: 24.0,
                    ),
                    TextField(
                        obscureText: true,
                        onChanged: (value) {
                          newPassword = value;
                        },
                        decoration: kDecoration.copyWith(
                          prefixIcon: Icon(Icons.vpn_key_outlined),
                          hintText: 'new password',
                        )),
                    SizedBox(
                      height: 24.0,
                    ),
                    TextField(
                        obscureText: true,
                        onChanged: (value) {
                          confirmNewPassword = value;
                        },
                        decoration: kDecoration.copyWith(
                          prefixIcon: Icon(Icons.vpn_key_outlined),
                          hintText: 'confirm new password',
                        )),
                    SizedBox(
                      height: 16.0,
                    ),
                    RoundButton(
                      onPressed: () async {
                        if (oldPassword.isNotEmpty &&
                            newPassword.isNotEmpty &&
                            confirmNewPassword.isNotEmpty) {
                          if (newPassword == confirmNewPassword) {
                            setState(() {
                              showSpinner = true;
                            });
                            var isMatched = await validatePassword(oldPassword);
                            if (isMatched) {
                              updatePassword(newPassword);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                              setState(() {
                                showSpinner = false;
                              });
                            } else {
                              AlertDialog(
                                title: Text('Alert'),
                                content: Text('Please check your password'),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Ok'))
                                ],
                              );
                            }
                          }
                        } else {
                          AlertDialog(
                            title: Text('Alert'),
                            content: Text('Please fill all the fields'),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Ok'))
                            ],
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
      ),
    );
  }
}
