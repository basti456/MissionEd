import 'package:flutter/material.dart';

class Network extends StatefulWidget {
  @override
  _NetworkState createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  bool button1 = true;
  bool button2 = false;
  bool button3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Network Section',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Color(0xff312C69),
                  fontSize: 28.0,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 25.0,
            ),
            Container(
              height: 62,
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  color: Colors.white),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            button1 = true;
                            button2 = false;
                            button3 = false;
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
                          setState(() {
                            button1 = false;
                            button2 = true;
                            button3 = false;
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
                          setState(() {
                            button1 = false;
                            button2 = false;
                            button3 = true;
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
            )
          ],
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
      color: isPressed ? Color(0xff312C69) : Colors.white,
      child: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isPressed ? Colors.white : Color(0xff312C69),
            ),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: isPressed ? Colors.white : Color(0xff4D3AA4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
