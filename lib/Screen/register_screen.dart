import 'package:aurora_task/ReUseableWidgets/TextFormFieldView.dart';
import 'package:aurora_task/StateManagement/SignUpProvider.dart';
import 'package:aurora_task/Styling/colors.dart';
import 'package:aurora_task/Styling/textStyles.dart';
import 'package:aurora_task/Widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<SignUpProvider>(context);
    return LayoutBuilder(builder: (context, size) {
      return Scaffold(
        body: Form(
          key: _provider.formkey,
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: size.maxHeight,
                        width: size.maxWidth,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('images/backgroundImage.jpg'),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: AppColors.whiteColor,
                                  radius: 15,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.maxHeight * 0.035,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Welcome To \nVeritable Nortary',
                                style: AppTextStyles.titleText
                                    .copyWith(color: AppColors.whiteColor),
                              ),
                            ),
                            Text(
                              'Let\'s start by getting your account setup',
                              style: AppTextStyles.titleText.copyWith(
                                  color: AppColors.whiteColor, fontSize: 14),
                            ),
                            SizedBox(
                              height: size.maxHeight * 0.035,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, bottom: 5.0),
                              child: Text(
                                'First Name *',
                                style: AppTextStyles.forgetPasswordText,
                              ),
                            ),
                            TextFormFieldView(
                              controller: _provider.firstnameController,
                              hint: 'John',
                              invalidateMassage: 'Please enter first name',
                            ),
                            SizedBox(
                              height: size.maxHeight * 0.025,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, bottom: 5.0),
                              child: Text(
                                'Last Name *',
                                style: AppTextStyles.forgetPasswordText,
                              ),
                            ),
                            TextFormFieldView(
                              controller: _provider.lastnameController,
                              hint: 'Doe',
                              invalidateMassage: 'Please enter last name',
                            ),
                            SizedBox(
                              height: size.maxHeight * 0.025,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, bottom: 5.0),
                              child: Text(
                                'Email *',
                                style: AppTextStyles.forgetPasswordText,
                              ),
                            ),
                            TextFormFieldView(
                              controller: _provider.emailController,
                              hint: 'johndoe@gmail.com',
                              invalidateMassage: 'Please enter email',
                            ),
                            SizedBox(
                              height: size.maxHeight * 0.025,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, bottom: 5.0),
                              child: Text(
                                'Phone Number *',
                                style: AppTextStyles.forgetPasswordText,
                              ),
                            ),
                            TextFormFieldView(
                              controller: _provider.phoneController,
                              hint: '+380662100222',
                              invalidateMassage: 'Please enter phone number',
                            ),
                            SizedBox(
                              height: size.maxHeight * 0.025,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10.0, bottom: 5.0),
                              child: Text(
                                'Password *',
                                style: AppTextStyles.forgetPasswordText,
                              ),
                            ),
                            TextFormFieldView(
                              controller: _provider.passwordController,
                              hint: '*********',
                              invalidateMassage: 'Please enter password',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 12.0, left: 10, right: 10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RaisedGradientButton(
                        child: Text(
                          'SUBMIT',
                          style: AppTextStyles.buttonText,
                        ),
                        gradient: LinearGradient(
                          colors: <Color>[
                            AppColors.orangeColor,
                            AppColors.deepOrangeColor
                          ],
                        ),
                        onPressed: () {
                          if (_provider.formkey.currentState.validate()) {
                            _provider.setLoading(true);
                            _provider.userRegister();
                          }
                        },
                      ),
                    ),
                  ),
                  _provider.loading
                      ? Container(
                          height: size.maxHeight,
                          width: size.maxWidth,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5)),
                        )
                      : SizedBox()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
