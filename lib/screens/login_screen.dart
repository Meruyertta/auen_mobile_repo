import 'dart:convert';

import 'package:auen/data/api_client.dart';
import 'package:auen/data/http_service.dart';
import 'package:auen/router/router.dart';
import 'package:auen/screens/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../core/logger.dart';
import '../style/colors/app_colors.dart';
import '../style/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController textControllerEmail;
  late TextEditingController textControllerPassword;
  bool emailNotEmpty = false;
  bool passwordNotEmpty = false;
  final ApiClient _apiClient = ApiClient();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();

    textControllerEmail.addListener(() {
      final isButtonActive = textControllerEmail.text.isNotEmpty;

      setState(() {
        emailNotEmpty = isButtonActive;
      });
    });

    textControllerPassword.addListener(() {
      final isButtonActive = textControllerPassword.text.isNotEmpty;

      setState(() {
        passwordNotEmpty = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textControllerEmail.dispose();
    textControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainBackgroundBlack,
      body: SingleChildScrollView(
        child: Container(
          height: h,
          width: w,
          margin: EdgeInsets.all(h * 0.05),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: h * 0.05, bottom: h * 0.04),
                height: h * 0.13,
                width: w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/image/logo_white.png"),
                )),
              ),
              SizedBox(
                height: h * 0.1,
              ),
              Container(
                height: h * 0.3,
                width: w * 0.8,
                margin: EdgeInsets.only(top: h * 0.05, bottom: h * 0.03),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('E-mail',
                            style: kLoginPageTextFieldHintTextStyle.copyWith(
                                color: AppColors.accentColorDarkPink)),
                        CustomTextFieldLogin(
                            textController: textControllerEmail)
                      ],
                    ),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Password',
                            style: kLoginPageTextFieldHintTextStyle.copyWith(
                                color: AppColors.accentColorDarkPink)),
                        CustomTextFieldLogin(
                          textController: textControllerPassword,
                          hintText: 'yourpassword',
                        )
                      ],
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: emailNotEmpty && passwordNotEmpty
                    ? () async {
                        setState(() {
                          emailNotEmpty = false;
                          passwordNotEmpty = false;
                        });
                        HttpService.login(textControllerEmail.text.trim(),
                            textControllerPassword.text.trim(), context);

                        // Response response = await _apiClient.login(
                        //     email: textControllerEmail.text.trim(),
                        //     password: textControllerPassword.text.trim());
                        // if (response.statusCode == 200 &&
                        //     jsonDecode(response.data)[0] == 'success') {
                        //   const storage = FlutterSecureStorage();
                        //   storage.write(
                        //       key: 'email',
                        //       value: textControllerEmail.text.trim());
                        //   Navigator.pushReplacementNamed(
                        //       context, AppRouter.home);
                        // } else {
                        //   await EasyLoading.showError(
                        //       "Error Code : ${response.statusCode.toString()}");
                        // }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentColorDarkPink),
                // child:Text('Sign in', style: kLoginPageTextFieldHintTextStyle,),
                child: Container(
                  width: w,
                  height: h * 0.05,
                  child: Center(
                    child: Text(
                      'Sign in',
                      style: kLoginPageSignInButtonStyle,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Column(
                children: [
                  Container(
                    width: w,
                    height: h * 0.03,
                    decoration: BoxDecoration(
                        // color: Colors.white70
                        ),
                    child: Text(
                      'Do not have an account?',
                      style: kLoginPageTextFieldHintTextStyle,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, AppRouter.register);
                    },
                    child: Container(
                      width: w,
                      height: h * 0.02,
                      decoration: BoxDecoration(),
                      child: Row(
                        children: [
                          Text(
                            'Sign up',
                            style: kLoginPageTextFieldHintTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldLogin extends StatelessWidget {
  CustomTextFieldLogin(
      {Key? key,
      required this.textController,
      this.hintText = 'yourname@example.com'})
      : super(key: key);

  final TextEditingController textController;
  String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: kLoginPageTextFieldTextStyle,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: kLoginPageTextFieldHintTextStyle,
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white54,
        )),
      ),
    );
  }
}
