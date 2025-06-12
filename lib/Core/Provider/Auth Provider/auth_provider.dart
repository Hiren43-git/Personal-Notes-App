import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Database%20Service/Auth%20Database%20Service/auth_service.dart';

import '../../../Modules/Login/Login Screen/Screens/login_screen.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();

  bool passwordHidden = true;
  bool conPasswordHidden = true;
  void showPassword() {
    if (passwordHidden == true) {
      passwordHidden = false;
      notifyListeners();
    } else {
      passwordHidden = true;
      notifyListeners();
    }
  }

  void validatePassword(
    String password,
  ) {
    if (password.isEmpty) {
      error = 'Password is required!';
    } else if (password.length < 6) {
      error = 'Password must be 6 letter!';
    } else if (!RegExp(r'[A-Z]').hasMatch(password) &&
        !RegExp(r'[a-z]').hasMatch(password)) {
      error = 'Password need at least 1 uppercase & 1 lowercase letter!';
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      error = 'Password need at least 1 number!';
    } else {
      error = null;
    }
    notifyListeners();
  }

  void validateConfirmPassword(
    String password,
  ) {
    if (password.isEmpty) {
      error = 'Confirm Password is required!';
    } else if (password.length < 6) {
      error = 'Confirm Password must be 6 letter!';
    } else if (!RegExp(r'[A-Z]').hasMatch(password) &&
        !RegExp(r'[a-z]').hasMatch(password)) {
      error = 'Confirm Password need at least 1 uppercase or lowercase letter!';
    } else if (!RegExp(r'[0-9]').hasMatch(password)) {
      error = 'Confirm Password need at least 1 number!';
    } else {
      error = null;
    }
    notifyListeners();
  }

  String? error = '';

  void showConfirmPassword() {
    if (conPasswordHidden == true) {
      conPasswordHidden = false;
      notifyListeners();
    } else {
      conPasswordHidden = true;
      notifyListeners();
    }
  }

  final AuthDatabaseService authService = AuthDatabaseService();

  bool loading = false;

  void setLoading(bool value) {
    loading = value;
    notifyListeners();
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    setLoading(true);
    // final res =
    await authService.signInWithEmailAndPassword(email, password);

    // if (res == true) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Login Successful !!'),
    //     ),
    //   );
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Login Successful !!'),
    //     ),
    //   );
    // }
    setLoading(false);
  }

  Future<void> signUp(String email, String password, String phone) async {
    await authService.signUpWithEmailAndPassword(email, password, phone);
  }

  Future<void> signOut(BuildContext context) async {
    await authService.signOut();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
