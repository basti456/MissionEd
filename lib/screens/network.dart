import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mission_ed/ModalFFs.dart';
import 'package:mission_ed/SingleFFS.dart';
import 'package:mission_ed/SingleSearch.dart';
import 'package:mission_ed/constsnts.dart';

class Network extends StatefulWidget {
  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  List<Ffs> _followerFollowingSearch = [];
  bool button1 = true;
  bool button2 = false;
  bool button3 = false;
  Widget fFs;
  Widget _search;
  int size;
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<Ffs>> getFData(String text) async {
    DatabaseReference refFData = FirebaseDatabase.instance
        .reference()
        .child('Users')
        .child(_auth.currentUser.uid)
        .child(text);
    refFData.once().then((DataSnapshot snapshot) {
      _followerFollowingSearch.clear();
      var keys = snapshot.value.keys;
      var values = snapshot.value;
      for (var key in keys) {
        Ffs fFollowing = new Ffs(
          uid: values[key]['uid'],
          name: values[key]['username'],
          image: values[key]['image'],
        );
        _followerFollowingSearch.add(fFollowing);
      }
      setState(() {
        size = _followerFollowingSearch.length;
      });
    });
    return _followerFollowingSearch;
  }

  Future<List<Ffs>> getAllData() async {
    DatabaseReference refFData =
        FirebaseDatabase.instance.reference().child('Users');
    refFData.once().then((DataSnapshot snapshot) {
      _followerFollowingSearch.clear();
      var keys = snapshot.value.keys;
      var values = snapshot.value;
      for (var key in keys) {
        Ffs fFollowing = new Ffs(
          uid: values[key]['id'],
          name: values[key]['username'],
          image: values[key]['imageUrl'],
        );
        _followerFollowingSearch.add(fFollowing);
      }
      setState(() {
        size = _followerFollowingSearch.length;
      });
    });
    return _followerFollowingSearch;
  }


  Future<List<Ffs>> searchMethod(String text) async {
    DatabaseReference refFData =
    FirebaseDatabase.instance.reference().child('Users');
    refFData.once().then((DataSnapshot snapshot) {
      _followerFollowingSearch.clear();
      var keys = snapshot.value.keys;
      var values = snapshot.value;
      for (var key in keys) {
        Ffs searchData = new Ffs(
          uid: values[key]['id'],
          name: values[key]['username'],
          image: values[key]['imageUrl'],
        );
        if(searchData.name.contains(text)){
          _followerFollowingSearch.add(searchData);
        }

      }
      setState(() {
        size = _followerFollowingSearch.length;
      });
    });
    return _followerFollowingSearch;
  }

  @override
  void initState() async {
    super.initState();
    await getFData('Followers');
    setState(() {
      fFs = Expanded(
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
                          onTap: () async {
                            await getFData('Followers');
                            setState(() {
                              button1 = true;
                              button2 = false;
                              button3 = false;
                              fFs = Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: _followerFollowingSearch.length,
                                    itemBuilder: (_, index) {
                                      return SingleFFS(
                                        name: _followerFollowingSearch[index]
                                            .name,
                                        imageUrl:
                                            _followerFollowingSearch[index]
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
                          onTap: () async {
                            await getFData('Following');
                            setState(() {
                              button1 = false;
                              button2 = true;
                              button3 = false;
                              button3 = false;
                              fFs = Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: _followerFollowingSearch.length,
                                    itemBuilder: (_, index) {
                                      return SingleFFS(
                                        name: _followerFollowingSearch[index]
                                            .name,
                                        imageUrl:
                                            _followerFollowingSearch[index]
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
                          onTap: () async {
                            await getAllData();
                            setState(() {
                              button1 = false;
                              button2 = false;
                              button3 = true;
                              fFs = Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: _followerFollowingSearch.length,
                                    itemBuilder: (_, index) {
                                      return SingleSearch(
                                        name: _followerFollowingSearch[index]
                                            .name,
                                        imageUrl:
                                        _followerFollowingSearch[index]
                                            .image,
                                      );
                                    }),
                              );
                              _search = Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: TextField(
                                    onChanged: (value) {
                                      searchMethod(value);
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
