import 'package:flutter/material.dart';
import 'package:personal_notes_app/Core/Database%20Service/Auth%20Database%20Service/auth_service.dart';

import '../../../Modules/Login/Login Screen/Screens/login_screen.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();
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

  String? error = '';
  void errorMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  bool validEmail(String value) {
    final email = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    return email.hasMatch(value);
  }

  bool validPassword(String value) {
    final password = RegExp(r"(?=.*[a-z])(?=.*[0-9]).{6,}$");
    return password.hasMatch(value);
  }

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
    await authService.signInWithEmailAndPassword(email, password);
    print('login');
    setLoading(false);
  }

  Future<void> signUp(String email, String password) async {
    await authService.signUpWithEmailAndPassword(email, password);
  }

  Future<void> signOut(BuildContext context) async {
    await authService.signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
