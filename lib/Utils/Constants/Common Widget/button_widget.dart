import 'package:flutter/material.dart';
import 'package:personal_notes_app/Utils/Constants/Color/colors.dart';

import '../../../Modules/Login/Login Screen/Widget/title_style.dart';

class ButtonWidget extends StatefulWidget {
  final String? text;
  const ButtonWidget({super.key,this.text});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.buttonColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: Text(
        widget.text!,
        style: titleStyle.copyWith(
          fontSize: 18,
          color: AppColors.backgroundColor,
        ),
      ),
    );
  }
}
