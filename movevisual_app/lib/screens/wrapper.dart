import 'package:flutter/material.dart';
import 'package:movevisual_app/screens/authenticate/authenticate.dart';
import 'package:movevisual_app/screens/home/home.dart';
import 'package:movevisual_app/models/user.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      
      return Home();
    }
  }
}