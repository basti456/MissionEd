import 'package:flutter/material.dart';

const kDecoration = InputDecoration(
  prefixIcon: Icon(Icons.email_outlined),
  hintText: 'Enter your Email.',
  fillColor: Color(0XFFFFFFFf),
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xff4D3AA4), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Color(0xff4D3AA4), width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);