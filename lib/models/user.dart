import 'package:cloud_firestore/cloud_firestore.dart';

class UserInfo {
  final String uid;
  final String? email;
  UserInfo(this.uid, this.email);
}

class UserData {
  final String uid;
  final String email;
  final String name;
  
  UserData( 
      {required this.uid,
      required this.email,
      required this.name,
     });

  factory UserData.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    return UserData(
      uid: doc.data()!['id'],
      email: doc.data()!['email'],
      name: doc.data()!['name'],
    
    );
  }
}
