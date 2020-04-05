import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class UserDatabaseService {

  final String uid;
  UserDatabaseService({ this.uid });

  //reference to users collection
  final CollectionReference usersCollection = Firestore.instance.collection('Users');

  Future updateUserData(String role) async {
    try{
      return await usersCollection.document(uid).setData(
        {
        'role': role
        }
      );
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Stream<DocumentSnapshot> role (String uid) {
    final Stream<DocumentSnapshot> userData = usersCollection.document(uid).get().asStream();
    return userData; 
  }
}

class AdministrationService {

  //instance of counting
  final CounterService _counterService = CounterService();

  //reference to account requests collection
  final CollectionReference accountRequestCollection = Firestore.instance.collection('Account Requests');

  //send account request to database
  Future requestAccount(String email, password) async {
    try{
      dynamic result = await accountRequestCollection.document(email).get();

      if(result != null){ 
        return null;
      } else{
        return await accountRequestCollection.document().setData(
          {
            'email': email,
            'password': password
          }
        );
      }
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //retrieve account requests from database
  Stream<QuerySnapshot> findAllRequests() {
    try{
      return accountRequestCollection.snapshots();
      //return await accountRequestCollection.getDocuments();
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //retrieve account request for processing
  // Future findOneRequest(String email) async {
  //   try{
  //     return await accountRequestCollection.document(email).get();
  //   } catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  //delete request from collection after processing
  Future deleteProcessedRequest(String email) async {
    try{
      await _counterService.decreaseRequests();
      await accountRequestCollection.document(email).delete();
    } catch(e){
      print(e.toString());
    }
  }

}

class StorageService {

  //storage reference
  final StorageReference _storageReference = FirebaseStorage.instance.ref();

  //choose image from gallery
  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.gallery).then(
      (image) {
        return image;
      }
    );
  }

  //upload image to storage
  Future uploadFile(String uid, File image) async {
    _storageReference.child('$uid/${Path.basename(image.path)}');
    StorageUploadTask uploadTask = _storageReference.putFile(image);
    await uploadTask.onComplete;
    print('file uploaded');
  }

  //retrieve image from storage
  Future getFile(String uid) async {
    _storageReference.child('$uid/');
    return await _storageReference.getDownloadURL();
  }

}

class CounterService {

  final CollectionReference _countReference = Firestore.instance.collection('Counting');

  // int getCountRequests() {
  //   try{
  //   var doc = _countReference.document('Requests');
  //   doc.get();
  //   return doc.data['amount'];
  //   } catch(e){
  //     print(e.toString());
  //     return null;
  //   }
  // }

  Future getCountRequests() async {
    try{
      return await _countReference.document('Requests').get();
    } catch(e){
      print(e.toString());
    }
  }

  Future increaseRequests() async {
    try{
      var amount = await getCountRequests();
      return await _countReference.document('Requests').updateData({'amount': amount++ });
    } catch(e){
      print(e.toString());
    }
  }

  Future decreaseRequests() async {
    try{
      var amount = await getCountRequests();
      return await _countReference.document('Requests').updateData({'amount': amount-- });
    } catch(e){
      print(e.toString());
    }
  }
}