
// We use name route
// All our routes will be available here
import 'package:case_study/screens/home/home_screen.dart';
import 'package:case_study/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
 HomeScreen.routeName: (context) => HomeScreen(),


};