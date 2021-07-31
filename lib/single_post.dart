import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SinglePost extends StatelessWidget {
  SinglePost({this.id, this.title, this.description, this.category, this.postedBy, this.imgUrl, this.username});
  final String id;
  final String title;
  final String description;
  final String category;
  final String postedBy;
  final String imgUrl;
  final String username;
  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var diff = now.difference(date);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + ' DAY AGO';
      } else {
        time = diff.inDays.toString() + ' DAYS AGO';
      }
    } else {
      if (diff.inDays == 7) {
        time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
      } else {
        time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
      }
    }
    return time;
  }
/*
  @override
  void initState() {
    super.initState();
    print("It runs");
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child('Posts');
    referenceData.once().then((DataSnapshot snapshot) {
      allPosts.clear();
      var keys = snapshot.value.keys;
      var values = snapshot.value;
      print(keys);
      print(values);
      for (var key in keys) {
        Posts post = new Posts(
            id: values[key]['id'],
            title: values[key]['id'],
            description: values[key]['id'],
            category: values[key]['id'],
            postedBy: values[key]['id'],
            imgUrl: values[key]['imgUrl'],
            username: values[key]['username']);
        allPosts.add(post);
      }
      print(allPosts);
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Color(0xffeaeaea),
                width: 1.5,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8.0),
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: imgUrl == ""
                                      ? AssetImage('images/dummy profile.png')
                                      : NetworkImage(imgUrl)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                username,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(category),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Icon(
                            Icons.watch_later,
                            color: Colors.blueAccent,
                            size: 32,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            readTimestamp(int.parse(id)),
                            style: TextStyle(color: Color(0xff312C69)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    height: 210.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              'https://cdn.dribbble.com/users/2394908/screenshots/10514933/media/310130d08451ef9c41904af397e0667f.jpg')),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 14,
          ),
        ],
      );
  }
}

