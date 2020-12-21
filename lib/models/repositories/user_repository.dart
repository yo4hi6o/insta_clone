import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_web/firebase_auth_web.dart';
import 'package:insta_clone/models/db/database_manager.dart';

class UserRepository {
  final DatabaseManager dbManager;
  UserRepository({this.dbManager});

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> isSignIn() async{
    final firebaseUser = await _auth.currentUser();
    if (firebaseUser != null){
      return true;
    }
    return false;
  }

}