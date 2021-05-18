import 'package:aurora_task/StateManagement/LoginProvider.dart';
import 'package:aurora_task/Styling/colors.dart';
import 'package:aurora_task/Styling/textStyles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Widgets/customButton.dart';
import 'login_screen.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Home Screen'),
          backgroundColor: AppColors.mainColor,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login successful',
                style: AppTextStyles.titleText,
              ),
              SizedBox(
                height: size.maxHeight * 0.1,
              ),
              RaisedGradientButton(
                child: Text(
                  'Logout',
                  style: AppTextStyles.buttonText,
                ),
                gradient: LinearGradient(
                  colors: <Color>[
                    AppColors.orangeColor,
                    AppColors.deepOrangeColor
                  ],
                ),
                onPressed: () {
                  signOut();
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  Future<void> signOut() async {
    await _auth.signOut().then((value) => Get.to(ChangeNotifierProvider(
        create: (_) => LoginProvider(), child: LoginScreen())));
  }
}
