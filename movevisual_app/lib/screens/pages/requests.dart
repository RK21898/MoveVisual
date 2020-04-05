import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movevisual_app/services/database.dart';
import 'package:movevisual_app/shared/loading.dart';
import 'package:movevisual_app/screens/pages/requestprocess.dart';

class Request extends StatefulWidget {
  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {

  final AdministrationService _administrationService = AdministrationService();
  final GlobalKey<AnimatedListState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Requests'),
      ),
      body: StreamBuilder(
        stream: _administrationService.findAllRequests(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return new Loading();
            default: if (snapshot.hasError) {
              return new Text('Error: ${snapshot.hasError}');
            } else {
              return AnimatedList(
                key: _globalKey,
                initialItemCount: snapshot.data.documents.length,
                itemBuilder: (BuildContext context, int index, Animation animation) {
                  return _buildItem(snapshot, index, animation);
                }
              );    
            }
          }
        }
      )
    );
  }

  Widget _buildItem(AsyncSnapshot<QuerySnapshot> item, int index, Animation animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        child: ListTile(
          title: Text(
            item.data.documents[index].data['email'],
            style: TextStyle(
              fontSize: 20.0,
            )
          ),
          leading: Icon(
            Icons.receipt,
            color: Colors.blue[900],
          ),
          onTap: () {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (BuildContext context) => RequestProcess(data: item.data.documents[index].data)
              )
            );
          }
        ),
        borderOnForeground: false,
        elevation: 0.0,
      ),
    );
  }
}