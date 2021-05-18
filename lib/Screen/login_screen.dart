import 'dart:ui';
import 'package:aurora_task/ReUseableWidgets/TextFormFieldView.dart';
import 'package:aurora_task/Screen/register_screen.dart';
import 'package:aurora_task/StateManagement/LoginProvider.dart';
import 'package:aurora_task/StateManagement/SignUpProvider.dart';
import 'package:aurora_task/Styling/colors.dart';
import 'package:aurora_task/Styling/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../Widgets/customButton.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<LoginProvider>(context);
    return LayoutBuilder(builder: (context, size) {
      return Scaffold(
        body: Form(
          key: _provider.formkey,
          child: SingleChildScrollView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                    height: size.maxHeight,
                    width: size.maxWidth,
                    child: Image.asset(
                      'images/backgroundImage.jpg',
                      fit: BoxFit.fitHeight,
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 55,
                        backgroundImage: NetworkImage(
                            'https://cdn.imgbin.com/2/4/15/imgbin-computer-icons-portable-network-graphics-avatar-icon-design-avatar-DsZ54Du30hTrKfxBG5PbwvzgE.jpg'),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.095,
                      ),
                      Text(
                        'Login',
                        style: AppTextStyles.titleText,
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.04,
                      ),
                      TextFormFieldView(
                        controller: _provider.emailController,
                        hint: 'Email',
                        invalidateMassage: 'Please enter email',
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.04,
                      ),
                      TextFormFieldView(
                        controller: _provider.passwordController,
                        hint: 'Password',
                        invalidateMassage: 'Please enter Password',
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.025,
                      ),
                      Text(
                        'Forgot Password?',
                        style: AppTextStyles.forgetPasswordText,
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.025,
                      ),
                      RaisedGradientButton(
                        child: Text(
                          'LOGIN',
                          style: AppTextStyles.buttonText,
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[
                            AppColors.orangeColor,
                            AppColors.deepOrangeColor
                          ],
                        ),
                        onPressed: () async {
                          if (_provider.formkey.currentState.validate()) {
                            _provider.setLoading(true);
                            _provider.userLogin();
                          }
                        },
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.025,
                      ),
                      InkWell(
                        onTap: () => Get.to(
                            ChangeNotifierProvider(
                                create: (_) => SignUpProvider(),
                                child: RegisterScreen()),
                            transition: Transition.rightToLeft,
                            duration: Duration(milliseconds: 500)),
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 5,
                            ),
                            child: Container(
                              width: double.infinity,
                              height: size.maxHeight * 0.08,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: <Color>[
                                      AppColors.secondMainColor
                                          .withOpacity(0.5),
                                      AppColors.mainColor
                                    ],
                                  ),
                                  color: AppColors.secondMainColor
                                      .withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(25)),
                              child: Center(
                                  child: Text(
                                'REGISTER',
                                style: AppTextStyles.buttonText,
                              )),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _provider.loading
                    ? Container(
                        height: size.maxHeight,
                        width: size.maxWidth,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                        decoration:
                            BoxDecoration(color: Colors.black.withOpacity(0.5)),
                      )
                    : SizedBox()
              ],
            ),
          ),
        ),
      );
    });
  }
}
