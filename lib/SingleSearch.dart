import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SingleSearch extends StatelessWidget {
  SingleSearch({this.imageUrl,this.name,this.id});
  final String imageUrl;
  final String name;
  final String id;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 80,
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
                  offset: Offset(4.0, 4.0), // shadow direction: bottom right
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(imageUrl),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                   name,
                    style: TextStyle(
                        color: Color(0xff312C69),
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Expanded(child: GestureDetector(
                  onTap: addToFollwing(id,name,imageUrl),
                  child: Text(
                    'Follow',
                    style: TextStyle(
                        color: Color(0xff312C69),
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

addToFollwing(String id,String username,String imageUrl) {
  FirebaseAuth _auth=FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance
      .reference()
      .child('Users')
      .child(_auth.currentUser.uid)
      .child('Following');
  databaseRef.child(id).set({
    'id': id,
    'imgUrl': imageUrl,
    'username': username,
  });
  final databaseFollowerRef = FirebaseDatabase.instance
      .reference()
      .child('Users')
      .child(id)
      .child('Following');
  databaseFollowerRef.child(_auth.currentUser.uid).set({
    'id': _auth.currentUser.uid ,
    'imgUrl': imageUrl,
    'username': username,
  });
}
