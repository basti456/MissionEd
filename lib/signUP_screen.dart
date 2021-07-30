import 'package:flutter/material.dart';
import 'package:mission_ed/home_screen.dart';
import 'package:mission_ed/rounded_button.dart';
import 'package:mission_ed/constsnts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mission_ed/authenticate/methods.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String email;
  String password;
  String username;
  String confirmPassword;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfcfc),
      body: isLoading
          ? Center(
              child: Container(
                height: 60.0,
                width: 60.0,
                child: CircularProgressIndicator(),
              ),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 60.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ' Welcome !',
                          style: TextStyle(
                              color: Color(0xff312C69),
                              fontSize: 24.0,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 6.5,
                        ),
                        Text(
                          ' SignUp here to explore',
                          style: TextStyle(
                            color: Color(0xff4D3AA4),
                            fontSize: 20.0,
                          ),
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
                              username = value.trim();
                            },
                            decoration: kDecoration.copyWith(
                                prefixIcon: Icon(Icons.person_outline_outlined),
                                hintText: 'Enter username')),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextField(
                          decoration: kDecoration,
                          onChanged: (value) {
                            email = value.trim();
                          },
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextField(
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                            decoration: kDecoration.copyWith(
                              prefixIcon: Icon(Icons.vpn_key_outlined),
                              hintText: 'Enter your password',
                            )),
                        SizedBox(
                          height: 16.0,
                        ),
                        TextField(
                            obscureText: true,
                            onChanged: (value) {
                              confirmPassword = value;
                            },
                            decoration: kDecoration.copyWith(
                              prefixIcon: Icon(Icons.vpn_key_outlined),
                              hintText: 'Confirm password',
                            )),
                        SizedBox(
                          height: 16.0,
                        ),
                        RoundButton(
                          onPressed: () async {
                            if (username.isNotEmpty &&
                                email.isNotEmpty &&
                                password.isNotEmpty &&
                                confirmPassword.isNotEmpty &&
                                password.length >= 6) {
                              if (password == confirmPassword) {
                                setState(() {
                                  isLoading = true;
                                });
                                createAccount(username, email, password)
                                    .then((user) {
                                  if (user != null) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                HomeScreen()));
                                  }
                                });
                              } else {
                                AlertDialog(
                                  title: Text('Alert'),
                                  content: Text('Please check your password'),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Ok')),
                                  ],
                                );
                              }
                            } else {
                              AlertDialog(
                                title: Text('Alert'),
                                content: Text('Please enter the fields'),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text('Ok')),
                                ],
                              );
                            }
                          },
                          colour: Color(0xff312C69),
                          text: 'Sign Up',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          ' Already have Account ?',
                          style: TextStyle(
                            textBaseline: TextBaseline.ideographic,
                            color: Color(0xff4D3AA4),
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'LogIn',
                          style: TextStyle(
                              color: Color(0xff4D3AA4),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(
                          color: Color(0xffeaeaea),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        height: 42, child: Image.asset('images/goog.png')),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
