import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Provider/Auth%20Provider/auth_provider.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/login_view.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/sign_up_view.dart';
import 'package:personal_notes_app/Modules/Login/Login%20Screen/Widget/title_style.dart';
import 'package:personal_notes_app/Utils/Constants/Color/colors.dart';
import 'package:personal_notes_app/Utils/Constants/Common%20Widget/icon_widget.dart';
import 'package:personal_notes_app/Utils/Constants/Images/images.dart';
import 'package:provider/provider.dart';

import '../../../../Utils/Constants/Strings/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(
      () {
        if (tabController.indexIsChanging) {
          final authProvider =
              Provider.of<AuthProvider>(context, listen: false);
          authProvider.emailController.clear();
          authProvider.passwordController.clear();
          authProvider.confirmPasswordController.clear();
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          AppStrings.notes,
          style: titleStyle.copyWith(fontSize: w * 0.05066),
        ),
        centerTitle: true,
        actions: [
          IconWidget(
            image: AppImages.question,
            height: w * 0.056,
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
                height: w * 0.05333,
              ),
              Center(
                child: Text(AppStrings.welcome,
                    style: titleStyle.copyWith(fontSize: w * 0.07466)),
              ),
              SizedBox(
                height: w * 0.05866,
              ),
              Container(
                height: w * 0.112,
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
                    controller: tabController,
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
                height: w * 0.064,
              ),
              Expanded(
                child: TabBarView(
                  controller: tabController,
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
    );
  }
}
