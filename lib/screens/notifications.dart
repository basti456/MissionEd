import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mission_ed/NotifacationModel.dart';
import 'package:mission_ed/screens/SingleNotification.dart';

import '../constants.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}



class _NotificationsState extends State<Notifications> {
  List<NotificationModel> notificationList=[];

  Future<List<NotificationModel>> getNotificationData() async {
    DatabaseReference referenceF = FirebaseDatabase.instance
        .reference()
        .child('Notifications');
    referenceF.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        notificationList.clear();
        var keys = snapshot.value.keys;
        var values = snapshot.value;
        for (var key in keys) {
          NotificationModel notification = new NotificationModel(
              postId: values[key]['postId'],
              title: values[key]['title'],
              username: values[key]['username'],
              postedBy: values[key]['postedBy'],
              imgUrl: values[key]['imgUrl']);
          notificationList.add(notification);
        }
        setState(() {
          print(notificationList);
        });
      }
    });
    return notificationList;
  }
  @override
  Widget build(BuildContext context) {
    getNotificationData();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Notification',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700),

                ),
              ),
              SizedBox(height: 15,),
              Divider(height: 0.5,color: Colors.blueGrey,),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: notificationList.length,
                  itemBuilder: (_, index) {
                    return SingleNotificationSection(
                      imgUrl: notificationList[index].imgUrl,
                      username: notificationList[index].username,
                      postTitle: notificationList[index].title,);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
