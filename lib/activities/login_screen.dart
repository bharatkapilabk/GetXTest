import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxtest/activities/home_screen.dart';
import 'package:getxtest/controllers/login_controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = LoginController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: SizedBox(
              width: MediaQuery.of(context).size.height * 1,
              child: GetBuilder<LoginController>(
                init: Get.put(LoginController()),
                builder: (loginController) => Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            key: const Key('email-field'),
                            keyboardType: TextInputType.emailAddress,
                            controller: loginController.emailController,
                            onChanged: (val) {
                              loginController.checkForValidEmail(
                                  loginController.emailController.text);
                            },
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Email is required';
                              } else if (LoginController.isEmailValid(value) ==
                                  false) {
                                return 'Invalid Email';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0D735B)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Color(0xff0D735B)),
                            ),
                          ),
                        ),
                        loginController.emailValid.value == true
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Email is valid ',
                                    style: TextStyle(color: Colors.green),
                                  ),
                                  const Icon(
                                    Icons.done,
                                    color: Colors.green,
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Email is valid ',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            key: const Key('password-field'),
                            controller: loginController.passwordController,
                            onChanged: (val) {
                              loginController.checkForValidPassword(
                                  loginController.passwordController.text);
                            },
                            obscureText: true,
                            validator: (String value) {
                              if (value.isEmpty) {
                                return 'Password is required';
                              } else if (LoginController.validatePassword(
                                      value) ==
                                  false) {
                                return 'Password not strong enough';
                              } else {
                                return null;
                              }
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff0D735B)),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(14),
                                ),
                              ),
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Color(0xff0D735B)),
                            ),
                          ),
                        ),
                        loginController.passwordValid.value == true
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Text(
                                                'Password contains 6 letters',
                                                style: TextStyle(
                                                    color: Colors.green)),
                                            const Icon(
                                              Icons.done,
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Text(
                                                'Password contains 1 special character',
                                                style: TextStyle(
                                                    color: Colors.green)),
                                            const Icon(
                                              Icons.done,
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Text(
                                                'Password contains 1 digit',
                                                style: TextStyle(
                                                    color: Colors.green)),
                                            const Icon(
                                              Icons.done,
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: Get.width * 1,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            const Text(
                                                'Password contains 1 uppercase and small case letter',
                                                style: TextStyle(
                                                    color: Colors.green)),
                                            const Icon(
                                              Icons.done,
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 1,
                                        child: const Text(
                                          'Password contains 6 letters',
                                          style: TextStyle(color: Colors.grey),
                                          textAlign: TextAlign.end,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 1,
                                        child: const Text(
                                            'Password contains 1 special character',
                                            style:
                                                TextStyle(color: Colors.grey),
                                            textAlign: TextAlign.end),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 1,
                                        child: const Text(
                                            'Password contains 1 digit',
                                            style:
                                                TextStyle(color: Colors.grey),
                                            textAlign: TextAlign.end),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        width: Get.width * 1,
                                        child: const Text(
                                            'Password contains 1 uppercase and small case letter',
                                            style:
                                                TextStyle(color: Colors.grey),
                                            textAlign: TextAlign.end),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                        Visibility(
                          key: const Key('login-button'),
                          visible: loginController.dataToShow.value,
                          child:loginController.isLoading.value==true?Container(child:const Center(child: CircularProgressIndicator(),),): ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(250, 60),
                              primary: const Color(0xff0D735B),
                              shape: const BeveledRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                            ),
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                loginController.login(loginController.emailController.text, loginController.passwordController.text);
                                // Get.to<LoginController>(() => HomeScreen());
                                // loginController.checkForValidity(loginController.emailController.text,loginController.passwordController.text);
                              } else {}
                            },
                            child: const Text('Login'),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          ),
        ),
      );
}
