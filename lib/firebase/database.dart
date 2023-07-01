import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lc_waikiki_app/firebase/cart.dart';
import 'package:lc_waikiki_app/services/user_data.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference userbasket =
      FirebaseFirestore.instance.collection('brews');

  Future<void> updateUserData(
    String total,
  ) async {
    return await userbasket.doc(uid).set({
      'total': total,
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

    return UserData(
      uid: uid,
      name: data?['name'] ?? 'new crew member',
    );
  }

  List<Cart> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;

      return Cart(
        total: data?['total'] ?? '',
      );
    }).toList();
  }

  Stream<List<Cart>> get cart {
    return userbasket.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData?> get userStoredData {
    return userbasket.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
