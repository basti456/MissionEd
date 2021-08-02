import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mission_ed/ModalFFs.dart';
import 'package:mission_ed/SingleFFS.dart';
import 'package:mission_ed/SingleSearch.dart';
import 'package:mission_ed/constsnts.dart';
import 'dart:async';

class Network extends StatefulWidget {
  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
   List<Ffs> _followerFollowingSearch = [];
  List<Ffs> _followerFollowingSearch1 = [];
  List<Ffs> _followerFollowingSearch2 = [];
  List<Ffs> _followerFollowingSearch3 = [];
  bool button1 = true;
  bool button2 = false;
  bool button3 = false;
  Widget fFs;
  Widget _search;
  int size;
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
/*      setState(() {
        size = _followerFollowingSearch.length;
      });*/
    });
    return _followerFollowingSearch;
  }

  List<Ffs> getfData() {
    DatabaseReference refFData = FirebaseDatabase.instance
        .reference()
        .child('Users')
        .child(_auth.currentUser.uid)
        .child('Following');
    refFData.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        _followerFollowingSearch1.clear();
        var keys = snapshot.value.keys;
        var values = snapshot.value;
        for (var key in keys) {
          Ffs fFollowing = new Ffs(
            uid: values[key]['id'],
            name: values[key]['username'],
            image: values[key]['imgUrl'],
          );
          _followerFollowingSearch1.add(fFollowing);
        }
      }
/*      setState(() {
        size = _followerFollowingSearch.length;
      });*/
    });
    return _followerFollowingSearch1;
  }

  List<Ffs> getAllData() {
    DatabaseReference refFData =
        FirebaseDatabase.instance.reference().child('Users');
    refFData.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        _followerFollowingSearch2.clear();
        var keys = snapshot.value.keys;
        var values = snapshot.value;
        for (var key in keys) {
          Ffs fFollowing = new Ffs(
            uid: values[key]['id'],
            name: values[key]['username'],
            image: values[key]['imgUrl'],
          );
          _followerFollowingSearch2.add(fFollowing);
        }
      }

/*      setState(() {
        size = _followerFollowingSearch.length;
        print(size);
        */ /*print(_followerFollowingSearch);*/ /*
      });*/
    });
    return _followerFollowingSearch2;
  }

  List<Ffs> searchMethod(String text) {
    DatabaseReference refFData =
        FirebaseDatabase.instance.reference().child('Users');
    refFData.once().then((DataSnapshot snapshot) {
      if (snapshot.value != null) {
        _followerFollowingSearch3.clear();
        var keys = snapshot.value.keys;
        var values = snapshot.value;
        for (var key in keys) {
          Ffs searchData = new Ffs(
            uid: values[key]['id'],
            name: values[key]['username'],
            image: values[key]['imgUrl'],
          );
          if (searchData.name.contains(text)) {
            print(searchData.name.contains(text));
            _followerFollowingSearch3.add(searchData);
          }
        }
        Timer(Duration(seconds: 1), () {
          setState(() {});
        });
      }
      /* setState(() {
        size = _followerFollowingSearch.length;
      });*/
    });
    return _followerFollowingSearch3;
  }

  @override
  void initState() {
    super.initState();
    getFData;
    setState(() {
      _followerFollowingSearch.length == 0
          ? fFs = Container(
              child: Center(
                  child: Text(
                'You have no followers yet',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              )),
            )
          : fFs = Expanded(
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Network Section',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Color(0xff312C69),
                      fontSize: 28.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                height: 62,
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            getFData;
                            setState(() {
                              button1 = true;
                              button2 = false;
                              button3 = false;
                              _followerFollowingSearch.length == 0
                                  ? fFs = Container(
                                      child: Center(
                                          child: Text(
                                        'You have no followers yet',
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    )
                                  : fFs = Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount:
                                              _followerFollowingSearch.length,
                                          itemBuilder: (_, index) {
                                            return SingleFFS(
                                              name: _followerFollowingSearch[
                                                      index]
                                                  .name,
                                              imageUrl:
                                                  _followerFollowingSearch[
                                                          index]
                                                      .image,
                                            );
                                          }),
                                    );
                              _search = null;
                            });
                          },
                          child: NetworkItems(
                            icon: Icons.person_rounded,
                            label: 'Followers',
                            isPressed: button1,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            getfData;
                            setState(() {
                              button1 = false;
                              button2 = true;
                              button3 = false;
                              _followerFollowingSearch1.length == 0
                                  ? fFs = Container(
                                      child: Center(
                                          child: Text(
                                        'You have no following yet',
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    )
                                  : fFs = Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount:
                                              _followerFollowingSearch1.length,
                                          itemBuilder: (_, index) {
                                            return SingleFFS(
                                              name: _followerFollowingSearch1[
                                                      index]
                                                  .name,
                                              imageUrl:
                                                  _followerFollowingSearch1[
                                                          index]
                                                      .image,
                                            );
                                          }),
                                    );
                              _search = null;
                            });
                          },
                          child: NetworkItems(
                            icon: Icons.people_rounded,
                            label: 'Following',
                            isPressed: button2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            print('runs');
                            print(getAllData());
                            /*print(_followerFollowingSearch[0]);*/
                            setState(() {
                              button1 = false;
                              button2 = false;
                              button3 = true;
                              _followerFollowingSearch2.length == 0
                                  ? fFs = Container(
                                      child: Center(
                                          child: Text(
                                        'No users available yet',
                                        style: TextStyle(
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                    )
                                  : fFs = Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount:
                                              _followerFollowingSearch2.length,
                                          itemBuilder: (_, index) {
                                            return SingleSearch(
                                              name: _followerFollowingSearch2[
                                                      index]
                                                  .name,
                                              imageUrl:
                                                  _followerFollowingSearch2[
                                                          index]
                                                      .image,
                                              id: _followerFollowingSearch2[
                                                      index]
                                                  .uid,
                                            );
                                          }),
                                    );
                              _search = Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextField(
                                    onChanged: (value) {
                                      searchMethod(value);
                                      setState(() {
                                        _followerFollowingSearch3.length == 0
                                            ? fFs = Container(
                                                child: Center(
                                                  child: Text(
                                                      "No user exist with this username"),
                                                ),
                                              )
                                            : fFs = Expanded(
                                                child: ListView.builder(
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        _followerFollowingSearch3
                                                            .length,
                                                    itemBuilder: (_, index) {
                                                      return SingleSearch(
                                                        name:
                                                            _followerFollowingSearch3[
                                                                    index]
                                                                .name,
                                                        imageUrl:
                                                            _followerFollowingSearch3[
                                                                    index]
                                                                .image,
                                                        id: _followerFollowingSearch3[
                                                                index]
                                                            .uid,
                                                      );
                                                    }),
                                              );
                                      });
                                    },
                                    decoration: kDecoration.copyWith(
                                        prefixIcon: Icon(
                                            Icons.youtube_searched_for_rounded),
                                        hintText: 'Enter username')),
                              );
                            });
                          },
                          child: NetworkItems(
                            icon: Icons.search,
                            label: 'Search',
                            isPressed: button3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              /* Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (_, index) {
                      return SingleFFS();
                    }),
              ),*/
              _search == null ? Container() : _search,
              SizedBox(
                height: 5.0,
              ),
              fFs == null
                  ? Container(
                      color: Colors.white,
                    )
                  : fFs
            ],
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
