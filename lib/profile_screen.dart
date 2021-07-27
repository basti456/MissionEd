import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Text(
                '  Profile Section',
                style: TextStyle(
                    color: Color(0xff312C69),
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 25.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/goog.png'),

                    ),
                  ),
                  SizedBox(width: 3,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 3.0),
                        child: Text(
                          'Ekagra Agrawal',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4D3AA4),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.0, vertical: 3.0),
                        child: Text(
                          'akagraagrawal89@gmail.com',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Color(0xff4D3AA4),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 25.0,),
              ProfileCard(text: 'General',),
              ProfileCard(text: 'Rewards',),
              ProfileCard(text: 'Accounts',)
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard({@required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0, 5.0, 0, 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color:Color(0xff4D3AA4),
                width: 1.5,),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 18.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w300,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
