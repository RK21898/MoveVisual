import 'package:flutter/material.dart';
import 'package:movevisual_app/services/auth.dart';
import 'package:movevisual_app/shared/constants.dart';
import 'package:movevisual_app/shared/loading.dart';

class Register extends StatefulWidget {

  final Function toggleView;
  Register({ this.toggleView });

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  //bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blue[100],
      appBar: AppBar(
        //backgroundColor: Colors.blue[900],
        elevation: 0.0,
        title: Text('Request Account'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person, color: Colors.white,),
            label: Text('Sign In'),
            textColor: Colors.white,
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(
                height: 20.0
              ),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 8 ? 'Enter a password 8+ characters long' : null,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(
                height: 20.0
              ),
              RaisedButton(
                //color: Colors.pink[400],
                child: Text(
                  'Request',
                  style: TextStyle(
                    color: Colors.white
                  )
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()) {
                    dynamic result = await _auth.requestWithEmailAndPassword(email, password);
                    if (result == null){
                      setState(() => error = 'Please supply a valid email');
                    // } else {
                    //   setState(() {
                    //       error = result;
                    //     }
                    //   );
                    }
                  }
                },
              ),
              SizedBox(
                height: 12,
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
        )
      ),
    );
  }
}