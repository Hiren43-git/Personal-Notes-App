import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Core/Provider/Auth Provider/auth_provider.dart';
import '../../../../Utils/Constants/Common Widget/button_widget.dart';
import '../../../../Utils/Constants/Common Widget/text_form_field.dart';
import '../../../../Utils/Constants/Strings/strings.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
            onSubmit: (value) {
              FocusScope.of(context).requestFocus(authProvider.phoneFocus);
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormFieldWidget(
            controller: authProvider.phoneController,
            focusNode: authProvider.phoneFocus,
            hint: AppStrings.phone,
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
