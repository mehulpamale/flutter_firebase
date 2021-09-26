import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  MyUser _userFromFirebaseUser(User? user) => MyUser(uid: (user!.uid));

  Stream<MyUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future signAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future register(String email, String password) async {
    // UserCredential userCred = await _auth.createUserWithEmailAndPassword(
    //     email: email, password: password);
    // User? user = userCred.user;
    _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => _userFromFirebaseUser(value.user));
    //     .onerror((error, stacktrace) {
    //   return null;
    // });
    // return _userFromFirebaseUser(user);
  }

  Future signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future signOut() async {
    _auth.signOut();
  }
}
