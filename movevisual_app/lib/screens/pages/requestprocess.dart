import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movevisual_app/services/auth.dart';
import 'package:movevisual_app/services/database.dart';
import 'package:movevisual_app/shared/constants.dart';

class RequestProcess extends StatefulWidget {
  
  final Map data;
  const RequestProcess({ this.data });

  // final Map data = {};
  // RequestProcess({ this.data });

  @override
  _RequestProcessState createState() => _RequestProcessState();
}


class _RequestProcessState extends State<RequestProcess> {

  final AuthService _auth = AuthService();
  final AdministrationService _administrationService = AdministrationService();
  final _formKey = GlobalKey<FormState>();

  List<String> roles = ["administrator", 'user'];

  String email = '';
  String password = '';
  String role = 'user';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Register Requested Account'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'email'),
                initialValue: widget.data['email'],
                validator: (val) => val != widget.data['email'] ? 'You cannot request an account with the wrong email adress' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                initialValue: widget.data['password'],
                validator: (val) => val != widget.data['password'] ? 'Please enter the requested password for this user' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 20.0
              ),
              DropdownButtonFormField(
                items: roles.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }
                ).toList(),
                decoration: dropDownDecoration.copyWith(hintText: 'User Role'),
                value: role, 
                onChanged: (val) {
                  setState(() => role = val);
                },
              ),
              SizedBox(
                height: 10.0
              ),
              FlatButton(
                child: Text(
                  'Complete Request',
                  style: TextStyle(
                    color: Colors.blue[900] 
                  ),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    dynamic result = await _auth.registerWithEmailAndPassword(email, password, role);
                    if (result == null){
                      setState(() => error = 'Please supply the requested credentials');
                    } else {
                      await _administrationService.deleteProcessedRequest(email);
                      Navigator.pop(context);
                    }
                  }  
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                error,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14.0 
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}