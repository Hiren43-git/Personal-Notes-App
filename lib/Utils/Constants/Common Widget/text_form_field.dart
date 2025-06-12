import 'package:flutter/material.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/title_style.dart';
import 'package:personal_notes_app/Utils/Constants/Color/colors.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged? onSubmit;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.focusNode,
    this.hint,
    this.onSubmit,
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      cursorHeight: 24,
      cursorColor: AppColors.textColor,
      autocorrect: false,
      controller: widget.controller,
      style: hintTextStyle,
      onFieldSubmitted: widget.onSubmit,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: hintTextStyle,
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
