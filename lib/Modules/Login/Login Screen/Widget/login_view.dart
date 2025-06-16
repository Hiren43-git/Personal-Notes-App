import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Provider/Auth%20Provider/auth_provider.dart';
import 'package:personal_notes_app/Modules/Home/Screens/home_screen.dart';
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
    final w = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          TextFormFieldWidget(
            validator: (value) {
              if (value!.isNotEmpty) {
                if (authProvider.validEmail(value)) {
                  authProvider.validEmail(value);
                } else {
                  authProvider.errorMessage(
                    context,
                    AppStrings.invalidEmail,
                  );
                }
              } else {
                return AppStrings.enterEmail;
              }
              return null;
            },
            controller: authProvider.emailController,
            focusNode: authProvider.emailFocus,
            hint: AppStrings.email,
            onSubmit: (value) {
              FocusScope.of(context).requestFocus(authProvider.passwordFocus);
            },
          ),
          SizedBox(
            height: w * 0.05,
          ),
          TextFormFieldWidget(
            validator: (value) {
              if (value!.isNotEmpty) {
                if (authProvider.validPassword(value)) {
                  authProvider.validPassword(value);
                } else {
                  authProvider.errorMessage(
                    context,
                    AppStrings.invalidPassword,
                  );
                  return AppStrings.passwordRequire;
                }
              } else {
                return AppStrings.enterPassword;
              }
              return null;
            },
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
                fontSize: w * 0.04,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.textColor,
              ),
            ),
          ),
          SizedBox(
            height: w * 0.06933,
          ),
          GestureDetector(
            onTap: () {
              if (authProvider.emailController.text.isEmpty ||
                  authProvider.passwordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('All field is required !!'),
                  ),
                );
              } else {
                if (authProvider
                    .validEmail(authProvider.emailController.text)) {
                  if (authProvider
                      .validPassword(authProvider.passwordController.text)) {
                    authProvider.login(
                      context,
                      authProvider.emailController.text,
                      authProvider.passwordController.text,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppStrings.loginSuccess,
                        ),
                      ),
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          AppStrings.invalidPassword,
                        ),
                      ),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AppStrings.invalidEmail),
                    ),
                  );
                }
              }
            },
            child: ButtonWidget(
              text: AppStrings.login,
            ),
          ),
        ],
      ),
    );
  }
}
