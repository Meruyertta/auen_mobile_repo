import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors/app_colors.dart';

const kLoginPageTextFieldHintTextStyle =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white54);
const kLoginPageTextFieldTextStyle =
    TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.white70);
var kLoginPageSignInButtonStyle =
    kLoginPageTextFieldHintTextStyle.copyWith(color: Colors.white);

const mainPageSectionHeaderTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.accentColorPink);

const mainPageTextStyle = TextStyle(color: Colors.white, fontSize: 18);

var feedPageTextStyle = mainPageTextStyle.copyWith(fontSize: 12);

const appBarTextStyle = TextStyle(color: Colors.white, fontSize: 20);

const mainTextStyle = TextStyle(color: Colors.white, fontSize: 17);

const mainTextStyleGrey = TextStyle(color: Colors.white70, fontSize: 15);
