import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../ModalFFs.dart';
import '../SingleSearch.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool button1 = true;
  bool button2 = false;
  bool button3 = false;
  Widget _fFs;
  List<Ffs> _followerFollowingSearch = [];

  FirebaseAuth _auth = FirebaseAuth.instance;

  List<Ffs> getAllData() {

  }

  @override
  void initState() {
    super.initState();
    print(getAllData());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child:     _followerFollowingSearch.length == 0
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
                    return SingleSearch(
                      name: _followerFollowingSearch[index].name,
                      imageUrl: _followerFollowingSearch[index].image,
                      id: _followerFollowingSearch[index].uid,
                    );
                  }),
            ),
          ),
        ],
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
