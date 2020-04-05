import 'package:flutter/material.dart';

const textInputDecoration = 
InputDecoration(
  //fillColor: Colors.white,
  filled: false,
  // enabledBorder: OutlineInputBorder(
  //   borderSide: BorderSide(
  //     width: 2.0,
  //   )
  // ),
  // focusedBorder: OutlineInputBorder(
  //   borderSide: BorderSide(
  //     //color: Colors.pink,
  //     width: 2.0,
  //   )
  // )
  focusColor: Colors.pink
);

const dropDownDecoration = 
InputDecoration(
  filled:false,
  isDense: true,
  icon: Icon(Icons.person),
  focusColor: Colors.pink,
);