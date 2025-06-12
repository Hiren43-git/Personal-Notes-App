import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Provider/Auth%20Provider/auth_provider.dart';
import 'package:personal_notes_app/Utils/Constants/Common%20Widget/button_widget.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/Constants/Color/colors.dart';
import '../../../../Utils/Constants/Common Widget/text_form_field.dart';
import '../../../../Utils/Constants/Strings/strings.dart';
import 'title_style.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormFieldWidget(
            controller: authProvider.emailController,
            focusNode: authProvider.emailFocus,
            hint: AppStrings.email,
            onSubmit: (value) {
              FocusScope.of(context).requestFocus(authProvider.passwordFocus);
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormFieldWidget(
            controller: authProvider.passwordController,
            focusNode: authProvider.passwordFocus,
            hint: AppStrings.password,
          ),
          SizedBox(
            height: 16,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              AppStrings.forgotPassword,
              style: hintTextStyle.copyWith(
                fontSize: 15,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.textColor,
              ),
            ),
          ),
          SizedBox(
            height: 26,
          ),
          ButtonWidget(
            text: AppStrings.login,
          ),
        ],
      ),
    );
  }
}
