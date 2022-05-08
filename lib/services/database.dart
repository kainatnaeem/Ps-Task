import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  // collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('psusers');

  Future<void> insertUserData(
    String email,
    String name,
 
  ) async {
    print(uid);
    print(email);
    print(name);
    return await userCollection.doc(uid).set({
      "uid": uid,
      'email': email,
      'name': name,
      
    });
  }
}
