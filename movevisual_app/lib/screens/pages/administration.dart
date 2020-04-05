import 'package:flutter/material.dart';
import 'package:movevisual_app/screens/pages/requests.dart';

class Administration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administration')
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(
                'Requests',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Request()
                  )
                );
              }
            ),
            RaisedButton(
              child: Text(
                'Edit Accounts',
              ),
              onPressed: () {
                
              }
            ),
            RaisedButton(
              child: Text(
                'Remove Accounts',
              ),
              onPressed: () {
                
              }
            ),
          ],
        ),
      ),
    );
  }
}