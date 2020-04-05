import 'dart:io';
import 'package:flutter/material.dart';
import 'package:movevisual_app/models/user.dart';
import 'package:movevisual_app/services/database.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {

  final StorageService _storageService = StorageService();

  //File _image;


  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Profile'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Image.network(_storageService.getFile(user.uid).toString()),
              Row(
                children: <Widget>[
                  Text('name'),
                  Text('job'),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
