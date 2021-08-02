import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mission_ed/constants.dart';
import 'package:mission_ed/rounded_button.dart';

import 'Modals.dart';

class Description extends StatefulWidget {
  const Description({Key key}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  String id;
  String username;
  String description;
  String imgPostUrl;
  String category;
  String title;
  FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseReference referenceData =
      FirebaseDatabase.instance.reference().child('Posts');

  void getData() {
    referenceData.once().then((DataSnapshot snapshot) {
      var values = snapshot.value;
      id=values['id'];
      title = values['title'];
      imgPostUrl = values['imgPostUrl'];
      category = values['category'];
      description = values['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Text(
                    'Mission Ed',
                    style: TextStyle(
                        color: kDarkPurple,
                        fontWeight: FontWeight.w900,
                        fontSize: 26.0,
                        letterSpacing: 2.5),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              title != null
                  ? Text(
                      title,
                      style: TextStyle(
                        color: kDarkPurple,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : Text(
                      'Android App Internship',
                      style: TextStyle(
                        color: kDarkPurple,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              SizedBox(
                height: 15,
              ),
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Color(0xff4D3AA4),
                      width: 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: imgPostUrl != null
                      ? Image.network(imgPostUrl)
                      : Image.network(
                          'https://cdn.dribbble.com/users/2394908/screenshots/10514933/media/310130d08451ef9c41904af397e0667f.jpg')),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Internship',
                    style: TextStyle(
                        color: kLightPurple,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '17/03/2001',
                    style: TextStyle(
                        color: kLightPurple,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              description != null
                  ? Text(
                      description,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300),
                    )
                  : Text(
                      'MissionEd in association with Entrepreneurship Development Cell (EDC), Delhi Technological University proudly presents you “How to Start Your Own Startup”, a webinar that will give you insights to drive change with innovation, where new and improved products enable new markets to be developed. Let’s hear one of the youngest entrepreneurs Mr. Prithwi Sinha, founder of MissionEd and Grameen who has done micro specialization in entrepreneurship and innovation from IIT Kharagpur.',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w300),
                    ),
              SizedBox(
                height: 50,
              ),
              RoundButton(
                colour: kDarkPurple,
                text: 'Apply',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
