import 'package:aurora_task/Screen/Home.dart';
import 'package:aurora_task/Screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<FormState> get formkey => _formkey;

// login with firebase
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  userLogin() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      user = userCredential.user;
      Get.to(Home(),
          transition: Transition.rightToLeft,
          duration: Duration(milliseconds: 500));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('Error', 'User not found please create user first',
            barBlur: 10.0);
      } else if (e.code == 'wrong-password') {
        Get.snackbar('Error', 'Incorrect password', barBlur: 10.0);
      }
    }
    setLoading(false);
  }

  bool _laoding = false;
  bool get loading => _laoding;
  setLoading(bool v) {
    _laoding = v;
    notifyListeners();
  }
}
