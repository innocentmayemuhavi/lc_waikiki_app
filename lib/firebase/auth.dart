import 'package:firebase_auth/firebase_auth.dart';
import 'package:lc_waikiki_app/firebase/database.dart';
import 'package:lc_waikiki_app/services/user_class.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserClass? _userFromFirebaseUser(User? userData) {
    if (userData != null) {
      return UserClass(
          uid: userData.uid,
          displayName: userData.displayName,
          phoneNumber: userData.phoneNumber);
    }
    return null;
  }

  Stream<UserClass?> get user =>
      _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user));

  Future registerWithEmailAndPassword(
    String email,
    String password,
    String displayName,
    String phoneNumber,
  ) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = FirebaseAuth.instance.currentUser;

      await user!.updateDisplayName(displayName);
      await user.updatePhoneNumber(phoneNumber as PhoneAuthCredential);
      User? userData = userCredential.user;

      await getUserData();
      //creating user data
      await DatabaseService(uid: userData!.uid).updateUserData(
        [],
      );

      return _userFromFirebaseUser(userData);
    } catch (e) {
      print(e);
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

  getUserData() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      String uid = user.uid;
      String? email = user.email;
      String? displayName = user.displayName;
    } else {
      print('No user is currently signed in.');
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? userData = userCredential.user;

      return _userFromFirebaseUser(userData);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
