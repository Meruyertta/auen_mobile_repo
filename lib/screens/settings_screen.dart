import 'package:auen/screens/main_screen.dart';
import 'package:auen/style/colors/app_colors.dart';
import 'package:auen/style/constants.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController textControllerEmail;
  late TextEditingController textControllerPassword;
  late TextEditingController textControllerName;

  @override
  void initState() {
    // TODO: implement initState
    textControllerEmail = TextEditingController();
    textControllerPassword = TextEditingController();
    textControllerName = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textControllerName.dispose();
    textControllerPassword.dispose();
    textControllerEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.mainBackgroundBlack  ,
      appBar: AppBar(
        backgroundColor: AppColors.accentColorPink,
        centerTitle: true,
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.01,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 50,
                    //Text
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.accentColorPink,
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Full Name',
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
                    CustomTextFieldLogin(textController: textControllerEmail)
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
                    Text('Location',
                        style: kLoginPageTextFieldHintTextStyle.copyWith(
                            color: AppColors.accentColorDarkPink)),
                    CustomTextFieldLogin(
                      textController: textControllerPassword,
                      hintText: 'yourpassword',
                    )
                  ],
                ),
                SizedBox(
                  height: h * 0.1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        width: w * 0.4,
                        child: CustomButton(
                          text: 'Cancel',
                        )),
                    Container(
                        width: w * 0.4,
                        child: CustomButton(
                          text: 'Save',
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
