import 'package:flutter/material.dart';
import 'package:mission_ed/constsnts.dart';
import 'package:mission_ed/home_screen.dart';
import 'package:mission_ed/rounded_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String _dropDownValue;
  String title;
  String description;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String username;
  /*
  @override
  void initState() {
    super.initState();
    FirebaseDatabase.instance.reference().child('Users').child(_auth.currentUser.uid).once().then((DataSnapshot snapshot){

    })
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 12),
                child: Text(
                  'Create Post',
                  style: TextStyle(
                      color: Color(0xff312C69),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                height: 180,
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
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                        "https://cdn.dribbble.com/users/533687/screenshots/3884681/attachments/882956/mikepiechota-howthey-design.jpg"),
                    Image.network(
                        'https://cdn.dribbble.com/users/2394908/screenshots/10514933/media/310130d08451ef9c41904af397e0667f.jpg')
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 3.0),
                  child: DropdownButton(
                    hint: _dropDownValue == null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Choose A Category',
                              style: TextStyle(color: Color(0xff4D3AA4)),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _dropDownValue,
                              style: TextStyle(color: Color(0xff4D3AA4)),
                            ),
                          ),
                    isExpanded: true,
                    icon: Icon(Icons.arrow_circle_down),
                    style: TextStyle(color: Color(0xff4D3AA4)),
                    items: [
                      'General',
                      'Internship',
                      'Question',
                      'Placement',
                      'Project'
                    ].map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownValue = val;
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 18.0,
              ),
              TextField(
                textAlign: TextAlign.start,
                onChanged: (val) {
                  title = val;
                },
                decoration: kPostDecoration.copyWith(labelText: 'Title'),
              ),
              SizedBox(
                height: 18.0,
              ),
              TextField(
                maxLines: 8,
                onChanged: (val) {
                  description = val;
                },
                textAlign: TextAlign.start,
                decoration: kPostDecoration.copyWith(labelText: 'Description'),
              ),
              SizedBox(
                height: 10,
              ),
              RoundButton(
                onPressed: () {
                  if (title.isNotEmpty && description.isNotEmpty) {
                    if (_dropDownValue != null) {
                      final user = _auth.currentUser;
                      final time = DateTime.now().microsecondsSinceEpoch;
                      final databaseRef = FirebaseDatabase.instance
                          .reference()
                          .child('Posts')
                          .child(time.toString());
                      databaseRef.set({
                        'id': time.toString(),
                        'title': title,
                        'description': description,
                        'category': _dropDownValue,
                        'postedBy': user.uid.toString(),
                        'imgUrl':user.photoURL==null?"":user.photoURL,
                        'username':""
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    } else {
                      AlertDialog(
                        title: Text('Alert'),
                        content: Text('Please select a category'),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Ok'))
                        ],
                      );
                    }
                  } else {
                    AlertDialog(
                      title: Text('Alert'),
                      content: Text('Please fill all fields'),
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
                text: 'Post',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
