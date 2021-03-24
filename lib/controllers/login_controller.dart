import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/activities/home_screen.dart';
import 'package:getxtest/networking/api_client.dart';
import 'package:getxtest/models/login_model.dart';

class LoginController extends GetxController {
  final emailValid = false.obs;
  final passwordValid = false.obs;
  final dataToShow = false.obs;
  final isLoading = false.obs;
  TextEditingController emailController;
  TextEditingController passwordController;
  ApiClient apiClient = ApiClient();
  LoginResp loginResp = LoginResp();

  static bool isEmailValid(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  static bool validatePassword(String value) {
    var pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    var regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  bool checkForValidEmail(String email) {
    if (isEmailValid(email)) {
      emailValid.value = true;
    } else {
      emailValid.value = false;
    }
    checkForBothEmailAndPassword();
    update();
    return emailValid.value;
  }

  bool checkForValidPassword(String password) {
    if (validatePassword(password)) {
      passwordValid.value = true;
    } else {
      passwordValid.value = false;
    }
    checkForBothEmailAndPassword();
    update();
    return passwordValid.value;
  }

  bool checkForBothEmailAndPassword() {
    if (emailValid.value == true && passwordValid.value == true) {
      dataToShow.value = true;
    } else {
      dataToShow.value = false;
    }
    update();
    return dataToShow.value;
  }

  void login(String email, String password) async {
    isLoading.value = true;
    update();
    if (dataToShow.value == true) {
      loginResp = await apiClient.login(emailController.text.toString(),
          passwordController.text.toString(), 'deviceToken');
      if (loginResp.status == '200') {
        await Get.to<LoginController>(() => HomeScreen());
      } else {
        isLoading.value = false;
        update();
        Get.snackbar<LoginController>('Error', 'Wrong Email or Password');
      }
    }
  }
}
