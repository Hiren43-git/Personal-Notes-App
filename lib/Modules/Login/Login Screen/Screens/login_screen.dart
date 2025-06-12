import 'package:flutter/material.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/login_view.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/sign_up_view.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/title_style.dart';
import 'package:personal_notes_app/Utils/Constants/Color/colors.dart';
import 'package:personal_notes_app/Utils/Constants/Common%20Widget/icon_widget.dart';
import 'package:personal_notes_app/Utils/Constants/Images/images.dart';

import '../../../../Utils/Constants/Strings/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: Text(
            AppStrings.notes,
            style: titleStyle,
          ),
          centerTitle: true,
          actions: [
            IconWidget(
              image: AppImages.question,
            ),
            SizedBox(
              width: 16,
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(AppStrings.welcome,
                      style: titleStyle.copyWith(fontSize: 28)),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.textBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TabBar(
                      indicator: BoxDecoration(
                        color: AppColors.backgroundColor,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            // ignore: deprecated_member_use
                            color: AppColors.titleColor.withOpacity(0.15),
                            blurStyle: BlurStyle.outer,
                            offset: Offset(
                              0,
                              0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelColor: AppColors.titleColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                      dividerColor: AppColors.textBackground,
                      isScrollable: false,
                      automaticIndicatorColorAdjustment: false,
                      dividerHeight: 0,
                      unselectedLabelColor: AppColors.textColor,
                      tabs: [
                        Tab(
                          text: AppStrings.login,
                        ),
                        Tab(
                          text: AppStrings.signUp,
                        ),
                      ]),
                ),
                SizedBox(
                  height: 24,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      LoginView(),
                      SignUpView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
