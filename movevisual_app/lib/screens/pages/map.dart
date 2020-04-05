import 'package:flutter/material.dart';
//import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class UnityMap extends StatefulWidget {

  UnityMap( {Key key} ) : super(key: key);

  @override
  _UnityMapState createState() => _UnityMapState();
}

class _UnityMapState extends State<UnityMap> {

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  //UnityWidgetController _unityWidgetController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Localization Map'),
      ),
      body: Card(
        elevation: 0.0,
        margin: EdgeInsets.all(5),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Stack(
          children: <Widget>[
            // UnityWidget(
            //   onUnityViewCreated: onUnityCreated,
            //   isARScene: false,
            // ),
            // FlatButton.icon(
            //   icon: Icon(Icons.arrow_upward),
            //   label: Text('Up'),
            //   onPressed: () {
            //     setMoveDirection('Up');
            //   },
            // ),
            // FlatButton.icon(
            //   icon: Icon(Icons.arrow_upward),
            //   label: Text('Left'),
            //   onPressed: () {
            //     setMoveDirection('Left');
            //   },
            // ),
            // FlatButton.icon(
            //   icon: Icon(Icons.arrow_upward),
            //   label: Text('Right'),
            //   onPressed: () {
            //     setMoveDirection('Right');
            //   },
            // ),
            // FlatButton.icon(
            //   icon: Icon(Icons.arrow_upward),
            //   label: Text('Down'),
            //   onPressed: () {
            //     setMoveDirection('Down');
            //   },
            // )
          ],
        )
      )
    );
  }

  
//   void onUnityCreated(controller) {
//     this._unityWidgetController = controller;
//   }

//   void onUnityMessage(controller, message) {
//     print('Received message from unity: ${message.toString()}');
//   }

//   void setMoveDirection(String direction) {
//     _unityWidgetController.postMessage(
//       'Camera', 
//       'CameraMovement', 
//       direction
//     );
//   }
}
