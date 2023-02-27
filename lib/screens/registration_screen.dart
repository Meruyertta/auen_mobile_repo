import 'package:auen/data/http_service.dart';
import 'package:auen/router/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/colors/app_colors.dart';
import '../style/constants.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late TextEditingController textControllerEmail;
  late TextEditingController textControllerPassword;
  late TextEditingController textControllerConfirmPassword;
  late TextEditingController textControllerName;
  late final GlobalKey<FormState> _form;
  bool emailNotEmpty = false;
  bool passwordNotEmpty = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerName = TextEditingController();
    textControllerConfirmPassword = TextEditingController();
    _form = GlobalKey<FormState>();
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
                height: h * 0.1,
                width: w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/image/logo_white.png"),
                )),
              ),
              // const Text('Login', style: TextStyle(
              //     fontSize: 25,fontWeight: FontWeight.w700, color: Colors.white
              // ), ),
              SizedBox(
                height: h * 0.01,
              ),
              Form(
                key: _form,
                child: Container(
                  height: h * 0.5,
                  width: w * 0.8,
                  margin: EdgeInsets.only(top: h * 0.05, bottom: h * 0.03),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name',
                              style: kLoginPageTextFieldHintTextStyle.copyWith(
                                  color: AppColors.accentColorDarkPink)),
                          CustomTextFieldLogin(
                            textController: textControllerName,
                            hintText: 'yourname',
                          )
                        ],
                      ),
                      SizedBox(
                        height: h * 0.04,
                      ),
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
                      SizedBox(
                        height: h * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Confirm Your Password',
                              style: kLoginPageTextFieldHintTextStyle.copyWith(
                                  color: AppColors.accentColorDarkPink)),
                          TextFormField(
                            controller: textControllerConfirmPassword,
                            style: kLoginPageTextFieldTextStyle,
                            validator: (val) {
                              if (val != textControllerPassword.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            onEditingComplete: () {
                              _form.currentState?.validate();
                            },
                            decoration: const InputDecoration(
                              hintText: 'retypeyourpassword',
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
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: emailNotEmpty && passwordNotEmpty
                    ? () {
                        setState(() {
                          emailNotEmpty = false;
                          passwordNotEmpty = false;
                        });
                        HttpService.login(textControllerEmail.text.trim(),
                            textControllerPassword.text.trim(), context);
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
                      'Sign Up',
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
                      'ALready have an account?',
                      style: kLoginPageTextFieldHintTextStyle,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, AppRouter.login);
                    },
                    child: Container(
                      width: w,
                      height: h * 0.02,
                      decoration: BoxDecoration(),
                      child: Row(
                        children: [
                          Text(
                            'Sign in',
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
