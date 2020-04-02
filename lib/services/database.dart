import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  final CollectionReference userCollection = Firestore.instance.collection('users');

  void updateSavedListings(var listingDetails) async {

    int count;
    var idList;
    await userCollection.document('$uid')
        .get()
        .then((DocumentSnapshot snapshot) {
      count = snapshot.data['listingsCount'];
    });
    await userCollection.document('$uid')
        .get()
        .then((DocumentSnapshot snapshot) {
      idList = snapshot.data['savedListings'];
    });
    count++;
    int id = listingDetails['_id'];
    idList.add(id);
    try {
      await userCollection.document('$uid').updateData({'listingsCount': count});
      await userCollection.document('$uid').updateData({'listing$id': listingDetails});
      await userCollection.document('$uid').updateData({'savedListings': idList});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List> getListingIds() async {
    var idList;
    await userCollection.document('$uid')
        .get()
        .then((DocumentSnapshot snapshot) {
    idList = snapshot.data['savedListings'];
    });
    return idList;
  }

  Future<List> getSavedListings() async {
    List listings = [];
    int count;
    var idList = await getListingIds();

    await userCollection.document('$uid')
        .get()
        .then((DocumentSnapshot snapshot) {
      count = snapshot.data['listingsCount'];
    });

    for(int i = 0; i < count; i++) {
      int j = idList[i];
      await userCollection.document('$uid')
          .get()
          .then((DocumentSnapshot snapshot) {
        listings.add(snapshot.data['listing$j']);
      });
    }
    return listings;
  }

  Future<void> deleteSavedListing(int listingId) async {
    var idList;
    int count;

    await userCollection.document('$uid')
        .get()
        .then((DocumentSnapshot snapshot) {
      idList = snapshot.data['savedListings'];
    });

    await userCollection.document('$uid')
        .get()
        .then((DocumentSnapshot snapshot) {
      count = snapshot.data['listingsCount'];
    });

    idList.remove(listingId);
    count--;

    try {
      await userCollection.document('$uid').updateData({'listingsCount': count});
      await userCollection.document('$uid').updateData({'listing$listingId': FieldValue.delete()});
      await userCollection.document('$uid').updateData({'savedListings': idList});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> getDisplayName() async {
    String name;
    await userCollection.document('$uid')
        .get()
        .then((DocumentSnapshot snapshot) {
      name = snapshot.data['displayName'];
    });
    return name;
  }

  Future<String> getEmail() async {
    String email;
    await userCollection.document('$uid')
        .get()
        .then((DocumentSnapshot snapshot) {
      email = snapshot.data['email'];
    });
    return email;
  }

  void updateDisplayName(String name) async {
    try {
      await userCollection.document('$uid').updateData({'displayName': name});
    } catch (e) {
      print(e.toString());
    }
  }

  void updateEmail(String email) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    try {
      await userCollection.document('$uid').updateData({'email': email});
      await user.updateEmail(email);
    } catch (e) {
      print(e.toString());
    }
  }
}