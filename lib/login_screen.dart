import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mission_ed/profile_screen.dart';
import 'package:mission_ed/rounded_button.dart';
import 'package:mission_ed/constsnts.dart';
import 'package:provider/provider.dart';
import 'google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffcfcfc),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ProfileScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Something Went Wrong'),
            );
          } else {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 80.0,
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
                          ' Sign In with your credentials',
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
                        TextField(decoration: kDecoration),
                        SizedBox(
                          height: 24.0,
                        ),
                        TextField(
                            decoration: kDecoration.copyWith(
                          prefixIcon: Icon(Icons.vpn_key_outlined),
                          hintText: 'Enter your password',
                        )),
                        SizedBox(
                          height: 16.0,
                        ),
                        RoundButton(
                          colour: Color(0xff312C69),
                          text: 'Log In',
                        ),
                        Text(
                          ' Forget your password ?',
                          style: TextStyle(
                            color: Color(0xff4D3AA4),
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.ideographic,
                      children: [
                        Text(
                          ' Don\'t have Account ?',
                          style: TextStyle(
                            textBaseline: TextBaseline.ideographic,
                            color: Color(0xff4D3AA4),
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'SignUp',
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
                    GestureDetector(
                      onTap: () {
                        final provider = Provider.of<GoogleSignInProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
                      child: Container(
                        height: 48,
                        child: Image.asset('images/goog.png'),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
