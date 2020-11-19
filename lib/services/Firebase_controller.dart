import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/home_screen/home_screen.dart';
import 'package:udemy_clone/Screens/sign_in_options/sign_in_screen/signin.dart';

class FirebaseController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  String get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void createAccount(String name, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(
            () => Get.offAll(
              SignIn(),
            ),
          );
    } catch (e) {
      Get.snackbar('Error Creating account', e.message);
    }
  }

  void login(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .whenComplete(
            () => Get.offAll(
              HomeScreen(),
            ),
          );
    } catch (e) {
      Get.snackbar('Error Logging in', e.message);
    }
  }

  void signout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar('Error Signing out', e.message);
    }
  }
}
