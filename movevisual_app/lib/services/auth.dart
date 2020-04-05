import 'package:firebase_auth/firebase_auth.dart';
import 'package:movevisual_app/models/user.dart';
import 'package:movevisual_app/services/database.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid): null;
  }

  //auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  //get signed uid
  Future get uid async {
    try{
      final FirebaseUser result = await _auth.currentUser();
      User user = _userFromFirebaseUser(result);
      return user.uid;
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //register with email and password
  Future registerWithEmailAndPassword(String email, String password, String role) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //create a new document for the user with the uid
      await UserDatabaseService(uid: user.uid).updateUserData(role);

      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  Future requestWithEmailAndPassword(String email, String password) async {
    try{
      dynamic result = await AdministrationService().requestAccount(email, password);

      if(result == null){
        return 'A request under this email has already been sent, please wait until it has been processed';
      } else{
        await CounterService().increaseRequests();
        return 'Your request has been sent, you will receive an email when it is processed';
      }
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}