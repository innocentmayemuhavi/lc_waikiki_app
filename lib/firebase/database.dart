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

  Future<void> addToCart(String userId, ProductData product) async {
    try {
      final userCartDoc = _userbasket.doc(userId);
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('cart').doc(userId).get();

      if (snapshot.exists) {
        List<dynamic> items = snapshot.data()?['items'] ?? [];
        items.add(product.toMap());
        await userCartDoc.update({
          'items': items,
        });
      } else {
        await userCartDoc.set({
          'items': [product.toMap()]
        });
      }
    } catch (e) {
      print('Error adding to cart: $e');
    }
  }

  Future<void> removeFromCart(String userId, ProductData product) async {
    try {
      final userCartDoc = _userbasket.doc(userId);
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('cart').doc(userId).get();

      if (snapshot.exists) {
        List<dynamic> items = snapshot.data()?['items'] ?? [];
        items.removeWhere((item) =>
            item['name'] == product.name &&
            item['quantity'] == product.quantity &&
            item['size'] == product.size);

        await userCartDoc.update({
          'items': items,
        });
      }
    } catch (e) {
      print('Error removing from cart: $e');
    }
  }

  Stream<List<ProductData>> getCart(String userId) {
    return _userbasket.doc(userId).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        return [];
      }

      final data = snapshot.data() as Map<String, dynamic>;
      final items = data['items'] as List<dynamic>;

      return items.map((item) {
        return ProductData(
            name: item['name'],
            image: item['image'],
            price: item['price'],
            quantity: item['quantity'],
            size: item['size']);
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
