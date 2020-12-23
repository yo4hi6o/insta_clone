import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insta_clone/models/db/database_manager.dart';

class UserRepository {
  final DatabaseManager dbManager;

  UserRepository({this.dbManager});

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> isSignIn() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      return true;
    }
    return false;
  }

  Future<bool> signIn() async {
    try {
      GoogleSignInAccount signInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication signInAuthentication = await signInAccount
          .authentication;

      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        idToken: signInAuthentication.idToken,
        accessToken: signInAuthentication.accessToken,);

      final firebaseUser = (await _auth.signInWithCredential(credential)).user;
      if (firebaseUser == null){
        return false;
      }

      //todo DBに登録
    }


  }
}