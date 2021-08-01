import 'package:flutter/material.dart';

class SingleFFS extends StatelessWidget {
  SingleFFS({this.imageUrl,this.name});
  final String imageUrl;
  final String name;

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
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: imageUrl==""?AssetImage('images/dummy profile.png'):NetworkImage(imageUrl),
                      ),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Color(0xff312C69),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
