import 'package:firebase_auth/firebase_auth.dart';
import 'package:pr2adminpanel/models/users.dart';


FirebaseAuth auth = FirebaseAuth.instance;
class AuthMethods {

  Users _userFromFirebaseUser (FirebaseUser user) {
    return user != null ? Users(uid: user.uid): null;

  }
  Stream <Users> get userStream {
    return auth.onAuthStateChanged.map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // Method to sign in
  Future signInWithEmailAndPassowrd (String email, String password) async {
    try {
      AuthResult result = await auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);

    }catch(e)
    {
      print(e.toString());

    }
  }
  Future signOut () async {
    try {
      await auth.signOut();


    }
    catch(e) {
      print(e.toString());
      return null;

    }
  }
}