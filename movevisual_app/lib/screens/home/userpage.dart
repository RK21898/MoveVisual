import 'package:flutter/material.dart';
import 'package:movevisual_app/screens/pages/profile.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          FlatButton(
            child: Text('Map'),
            onPressed: () {
              
            },
          ),
          FlatButton(
            child: Text('Profile'),
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (BuildContext context) => Profile()
                )
              );
            },
          ),
          FlatButton(
            child: Text('Settings'),
            onPressed: () {
              
            },
          ),
        ],
      )
    );
  }
}