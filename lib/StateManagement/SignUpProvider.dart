import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpProvider extends ChangeNotifier {
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController get firstnameController => _firstnameController;

  TextEditingController _lastnameController = TextEditingController();
  TextEditingController get lastnameController => _lastnameController;

  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  TextEditingController _phoneController = TextEditingController();
  TextEditingController get phoneController => _phoneController;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController => _passwordController;

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  GlobalKey<FormState> get formkey => _formkey;

  // Register user via firebase auth credentials
  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  Future userRegister() async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text);
      user = userCredential.user;
      setLoading(false);
      Get.back();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar('Error', 'The password provided is too weak.',
            barBlur: 10.0);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar('Error', 'The account already exists for that email.',
            barBlur: 10.0);
      }
    } catch (e) {
      print(e);
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
