import 'package:flutter/material.dart';
import 'package:mission_ed/constsnts.dart';
import 'package:mission_ed/rounded_button.dart';

class CreatePost extends StatefulWidget {

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String _dropDownValue;
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
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
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
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )
                ],
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
                child: DropdownButton(
                  hint: _dropDownValue == null
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Category',
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
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
                labelText: 'Title',
                labelStyle: TextStyle(
                    color: Color(0xff312C69),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400),
                fillColor: Color(0XFFFFFFFf),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff4D3AA4), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff4D3AA4), width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
            ),
            SizedBox(
              height: 18.0,
            ),
            TextField(
              maxLines: 8,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
                labelText: 'Description',
                labelStyle: TextStyle(
                    color: Color(0xff312C69),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400),
                fillColor: Color(0XFFFFFFFf),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff4D3AA4), width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff4D3AA4), width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
            ),
            SizedBox(height: 10,),
            RoundButton(
              onPressed: () {},
              colour: Color(0xff312C69),
              text: 'Post',
            ),
          ],
        ),
      )),
    );
  }
}
