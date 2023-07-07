import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lc_waikiki_app/firebase/cart.dart';
import 'package:lc_waikiki_app/services/product_data.dart';
import 'package:lc_waikiki_app/services/user_data.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference _userbasket =
      FirebaseFirestore.instance.collection('cart');

  Future<void> updateUserData(
    String total,
  ) async {
    return await _userbasket.doc(uid).set({
      'total': total,
    });
  }

  Future<void> addToCart(ProductData product) async {
    try {
      await _userbasket.add(product.toMap());
    } catch (e) {
      print('Error adding to cart: $e');
    }
  }

  Stream<List<ProductData>> getCart() {
    return _userbasket.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ProductData(
            name: data['name'],
            image: data['image'],
            price: data['price'],
            quantity: data['quantity'],
            size: data['size']);
      }).toList();
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
    return _userbasket.snapshots().map(_brewListFromSnapshot);
  }

  Stream<UserData?> get userStoredData {
    return _userbasket.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
