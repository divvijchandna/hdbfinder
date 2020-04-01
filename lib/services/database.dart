import 'package:cloud_firestore/cloud_firestore.dart';

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


}