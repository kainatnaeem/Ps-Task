import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pstask/models/user.dart' as userinfo;

import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'database.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('psusers');

  // create user obj based on firebase user
  userinfo.UserInfo? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return userinfo.UserInfo(user.uid, user.email,);
  }

// Future<String?> getCurrentUID() async{


//     final auth.User? user = await _firebaseAuth.currentUser;
//     final String? uid = user?.uid;
//     return uid;
//   }


  Stream<auth.User?> get user => _firebaseAuth.authStateChanges();

  Future<userinfo.UserInfo?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFromFirebase(credential.user);
    } on auth.FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('no user found');
      } else if (error.code == 'wrong-password') {
        print('wrong password provided for that user');
      }
    }
    return null;
  }
Future<userinfo.UserInfo?> createUserWithEmailAndPassword(String email, String password,
     String name, ) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      auth.User? user = credential.user ; 
      await DatabaseService(uid: user!.uid)
          .insertUserData(email,name);
      return _userFromFirebase(credential.user);
    }on auth.FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
    return null;
      }

  
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

      }
