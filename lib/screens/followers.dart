import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../ModalFFs.dart';
import '../SingleFFS.dart';

class FollowerScreen extends StatefulWidget {
  const FollowerScreen({Key key}) : super(key: key);

  @override
  _FollowerScreenState createState() => _FollowerScreenState();
}

class _FollowerScreenState extends State<FollowerScreen> {
  bool button1 = true;
  bool button2 = false;
  bool button3 = false;
  Widget _fFs;
  List<Ffs> _followerFollowingSearch = [];

  FirebaseAuth _auth = FirebaseAuth.instance;

  List<Ffs> getFData() {
    DatabaseReference refFData = FirebaseDatabase.instance
        .reference()
        .child('Users')
        .child(_auth.currentUser.uid)
        .child('Followers');
    refFData.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        _followerFollowingSearch.clear();
        var keys = snapshot.value.keys;
        var values = snapshot.value;
        for (var key in keys) {
          Ffs fFollowing = new Ffs(
            uid: values[key]['id'],
            name: values[key]['username'],
            image: values[key]['imgUrl'],
          );
          _followerFollowingSearch.add(fFollowing);
        }
      }
    });
    return _followerFollowingSearch;
  }
 @override
  void initState() {
    super.initState();
    getFData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: GestureDetector(
          onTap: () {
            setState(() {
              button1 = true;
              button2 = false;
              button3 = false;
              _followerFollowingSearch.length == 0
                  ? _fFs = Container(
                      child: Center(
                          child: Text(
                        'You have no followers yet',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    )
                  : _fFs = Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: _followerFollowingSearch.length,
                          itemBuilder: (_, index) {
                            return SingleFFS(
                              name: _followerFollowingSearch[index].name,
                              imageUrl: _followerFollowingSearch[index].image,
                            );
                          }),
                    );
            });
          },
          child: NetworkItems(
            icon: Icons.person_rounded,
            label: 'Followers',
            isPressed: button1,
          ),
        ),
      ),
    );
  }
}

class NetworkItems extends StatelessWidget {
  NetworkItems({this.icon, this.label, this.isPressed});

  final IconData icon;
  final String label;
  final bool isPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isPressed
          ? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(4.0, 4.0), // shadow direction: bottom right
                )
              ],
              /*  border: Border.all(color: Color(0xff312C69),
             width: 0.2
             )*/
            )
          : BoxDecoration(
              color: Colors.white,
            ),
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Color(0xff312C69),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Color(0xff4D3AA4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
