import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future updateUserData(String listingId) async {
    return await userCollection.document(uid).collection('listings').document('listingId');
  }

}