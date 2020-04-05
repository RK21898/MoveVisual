
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movevisual_app/models/user.dart';
import 'package:movevisual_app/services/auth.dart';
import 'package:movevisual_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'adminpage.dart';
import 'userpage.dart';

class Home extends StatelessWidget {

  //instantiate connections with authentication and database
  final AuthService _auth = AuthService();
  final UserDatabaseService _databaseService = UserDatabaseService();

  @override
  Widget build(BuildContext context) {

    //get the signed in user from the root through inheritance
    final user = Provider.of<User>(context);

    return Scaffold(
      //backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('MoveVisual'),
        //backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _databaseService.role(user.uid),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError || !snapshot.hasData) {
            return Text('Error: ${snapshot.error}');
          } else{
            switch(snapshot.connectionState){
              case ConnectionState.waiting: return SpinKitDoubleBounce( size: 20);
              default: return checkUserRole(snapshot.data);
            }
          }
        },
      ),
    );
  }
}

Widget checkUserRole(DocumentSnapshot snapshot) {
  if(snapshot.data['role'] == 'administrator'){
    return AdminPage();
  } else{
    return UserPage();
  }
}