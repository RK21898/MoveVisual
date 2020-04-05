import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movevisual_app/screens/wrapper.dart';
import 'package:movevisual_app/services/auth.dart';
import 'package:movevisual_app/models/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Colors.blue,
          //accentColorBrightness: Brightness.light,
          accentIconTheme: IconThemeData(
            color: Colors.white,
            opacity: 1.0,
            size: 20
          ),
          appBarTheme: AppBarTheme(
            actionsIconTheme: IconThemeData(
              color: Colors.white,
              opacity: 1.0,
              size: 30,
            ),
            color: Colors.blue[900]
          ),
          //backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          //brightness: Brightness.light,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue[900],
            highlightColor: Colors.blue[500],
            //textTheme: ButtonTextTheme.primary
          ),
          canvasColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.white,
            opacity: 1,
          ),
          primaryColor: Colors.blue[700],
        ),
        home: Wrapper(),
      ),
    );
  }
}