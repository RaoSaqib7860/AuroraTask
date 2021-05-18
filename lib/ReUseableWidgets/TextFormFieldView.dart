import 'package:aurora_task/AnimationClasses/AllClasses.dart';
import 'package:aurora_task/Styling/colors.dart';
import 'package:aurora_task/Styling/textStyles.dart';
import 'package:flutter/material.dart';

class TextFormFieldView extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final String invalidateMassage;
  TextFormFieldView(
      {Key key,
      @required this.controller,
      @required this.invalidateMassage,
      @required this.hint})
      : super(key: key);

  @override
  _TextFormFieldViewState createState() => _TextFormFieldViewState();
}

class _TextFormFieldViewState extends State<TextFormFieldView> {
  @override
  Widget build(BuildContext context) {
    return FlipInY(
      duration: Duration(
        milliseconds: 700,
      ),
      delay: Duration(milliseconds: 500),
      child: Container(
        height: MediaQuery.of(context).size.height/14,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.whiteColor),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTextStyles.textField,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            border: InputBorder.none,
          ),
          validator: (value) {
            if (value.isEmpty) {
              return widget.invalidateMassage;
            }
            return null;
          },
        ),
      ),
    );
  }
}
