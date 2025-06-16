import 'package:flutter/material.dart';
import 'package:personal_notes_app/Modules/Home/Screens/home_screen.dart';
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
            height: w * 0.064,
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
            onSubmit: (value) {
              FocusScope.of(context)
                  .requestFocus(authProvider.confirmPasswordFocus);
            },
          ),
          SizedBox(
            height: w * 0.064,
          ),
          TextFormFieldWidget(
            validator: (value) {
              if (value != null) {
                value != authProvider.passwordController.text
                    ? authProvider.errorMessage(
                        context,
                        AppStrings.passwordNotMatch,
                      )
                    : AppStrings.passwordRequire;
              } else {
                return AppStrings.enterRepeatPassword;
              }
              return null;
            },
            controller: authProvider.confirmPasswordController,
            focusNode: authProvider.confirmPasswordFocus,
            hint: AppStrings.repeatPassword,
            onSubmit: (value) {
              FocusScope.of(context).requestFocus(authProvider.phoneFocus);
            },
          ),
          SizedBox(
            height: w * 0.06933,
          ),
          GestureDetector(
            onTap: () {
              if (authProvider.emailController.text.isEmpty ||
                  authProvider.passwordController.text.isEmpty ||
                  authProvider.confirmPasswordController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('All field is required !!'),
                  ),
                );
              } else {
                if (authProvider
                    .validEmail(authProvider.emailController.text)) {
                  if (authProvider.validPassword(
                          authProvider.passwordController.text) &&
                      authProvider.passwordController.text.isNotEmpty) {
                    if (authProvider.passwordController.text ==
                        authProvider.confirmPasswordController.text) {
                      authProvider.signUp(
                        authProvider.emailController.text,
                        authProvider.passwordController.text,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppStrings.signUpSuccess,
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
                          content: Text(AppStrings.passwordNotMatch),
                        ),
                      );
                    }
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
              text: AppStrings.signUp,
            ),
          ),
        ],
      ),
    );
  }
}
