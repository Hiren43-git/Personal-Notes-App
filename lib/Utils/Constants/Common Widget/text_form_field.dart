import 'package:flutter/material.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/title_style.dart';
import 'package:personal_notes_app/Utils/Constants/Color/colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged? onSubmit;
  final FormFieldValidator? validator;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.focusNode,
    this.hint,
    this.onSubmit,
    this.validator,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return TextFormField(
      validator: widget.validator,
      focusNode: widget.focusNode,
      cursorHeight: w * 0.064,
      cursorColor: AppColors.textColor,
      autocorrect: false,
      controller: widget.controller,
      style: hintTextStyle.copyWith(fontSize: w * 0.04266),
      onFieldSubmitted: widget.onSubmit,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: hintTextStyle.copyWith(fontSize: w * 0.04266),
        filled: true,
        fillColor: AppColors.textBackground,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
