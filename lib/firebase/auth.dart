import 'package:firebase_auth/firebase_auth.dart';
import 'package:lc_waikiki_app/firebase/database.dart';
import 'package:lc_waikiki_app/services/user_class.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserClass? _userFromFirebaseUser(User? userData) {
    if (userData != null) {
      return UserClass(uid: userData.uid);
    }
    return null;
  }

  Stream<UserClass?> get user =>
      _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));

  Future registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? userData = userCredential.user;
      //creating user data
      await DatabaseService(uid: userData!.uid).updateUserData(
        '0',
      );
      return _userFromFirebaseUser(userData);
    } catch (e) {
      print('error');
      return null;
    }
  }

  Future SignOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? userData = userCredential.user;

      return _userFromFirebaseUser(userData);
    } catch (e) {
      print('error');
      return null;
    }
  }
}
