import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:udemy_clone/services/storage.dart';

class Authentication {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  final SecureStorage secureStorage = SecureStorage();

  Future<String> googlesignin() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);
    final User user = userCredential.user;
    assert(user.displayName != null);
    assert(user.email != null);
    final User currentUser = _firebaseAuth.currentUser;
    assert(currentUser.uid == user.uid);
    secureStorage.writeSecureData('email', user.email);
    secureStorage.writeSecureData('name', user.displayName);
    return 'error ocurred';
  }

  Future<String> googleSignOut() async {
    _googleSignIn.signOut();
    return "Error out";
  }
}
