import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:insta_clone/data_models/user.dart';
import 'package:insta_clone/models/db/database_manager.dart';

class UserRepository {
  final DatabaseManager dbManager;

  UserRepository({this.dbManager});

  static User currentUser;

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> isSignIn() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser != null) {
      currentUser = await dbManager.getUserInfoFromDbById(firebaseUser.uid);
      return true;
    }
    return false;
  }

  Future<bool> signIn() async {
    try {
      GoogleSignInAccount signInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication signInAuthentication =
          await signInAccount.authentication;

      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        idToken: signInAuthentication.idToken,
        accessToken: signInAuthentication.accessToken,
      );

      final firebaseUser = (await _auth.signInWithCredential(credential)).user;
      if (firebaseUser == null) {
        return false;
      }

      final isUserExistedInDb = await dbManager.searchUserInDb(firebaseUser);
      if (!isUserExistedInDb) {
        await dbManager.insertUser(_convertToUser(firebaseUser));
      }
      currentUser = await dbManager.getUserInfoFromDbById(firebaseUser.uid);
      return true;
    } catch (error) {
      print("sign in error caught!: ${error.toString()}");
      return false;
    }
  }

  _convertToUser(auth.User firebaseUser) {
    return User(
      userId: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      inAppUserName: firebaseUser.displayName,
      photoUrl: firebaseUser.photoURL,
      email: firebaseUser.email,
      bio: "",
    );
  }

  Future<User> getUserById(String userId) async {
    return await dbManager.getUserInfoFromDbById(userId);
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
    currentUser = null;
  }

  Future<int> getNumberOfFollowers(User profileUser) async {
    return (await dbManager.getFollowerUserIds(profileUser.userId)).length;
  }

  Future<int> getNumberOfFollowings(User profileUser) async {
    return (await dbManager.getFollowingUserIds(profileUser.userId)).length;
  }

  Future<void> updateProfile(
    User profileUser,
    String nameUpdated,
    String bioUpdated,
    String photoUrlUpdated,
    bool isImageFromFile,
  ) async {
    //todo
  }
}
