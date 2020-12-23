import 'package:firebase_auth/firebase_auth.dart'as auth;
import 'package:insta_clone/models/db/database_manager.dart';

class UserRepository {
  final DatabaseManager dbManager;
  UserRepository({this.dbManager});

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  Future<bool> isSignIn() async{
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null){
      return true;
    }
    return false;
  }

  Future<bool> signIn() async{

  }

}