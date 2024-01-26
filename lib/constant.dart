import 'package:case_study/size_config.dart';
import 'package:flutter/material.dart';

const String apiUrl =
    'https://reqres.in/api/';
const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFFB6B6B6);
const kTextColor = Color(0xFF757575);
const kGreenColor = Color(0xFF68904D);

const kAnimationDuration = Duration(milliseconds: 200);
const kDefaultPadding = 20.0;
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
final headingStyleWithPrimaryColor = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  color: kPrimaryColor,
  fontWeight: FontWeight.bold,
);
final headingStyleWithBlack = TextStyle(
  color: Colors.black,
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
);
final textStyle = TextStyle(
  fontSize: getProportionateScreenWidth(25),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
final greyMediumTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(20),
  fontWeight: FontWeight.normal,
  color: Colors.grey,
);
final greySmallTextStyle = TextStyle(
  fontSize: getProportionateScreenWidth(12),
  fontWeight: FontWeight.normal,
  color: Colors.grey,
);


const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kSamePassword = "Old Password and new Password is same ";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kUsernamelNullError = "Please Enter Username";
final RegExp usernameValidatorRegExp = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
const String kInvalidUsernameError = "Please Enter Valid Username";
const String kInvalidTextError = "Please Decribe your issues";
final RegExp tokenRegExp = RegExp(
  r'([A-Za-z0-9]+(\.[A-Za-z0-9]+)+)_[A-Za-z0-9]+',
  caseSensitive: false,
  multiLine: false,
);
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
