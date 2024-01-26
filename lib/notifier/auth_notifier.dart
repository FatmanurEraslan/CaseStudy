import 'package:case_study/components/toast.dart';
import 'package:case_study/screens/home/home_screen.dart';
import 'package:case_study/screens/sign_in/sign_in_screen.dart';
import 'package:case_study/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authNotifierProvider = StateNotifierProvider<AuthNotifier, bool>(
    (ref) => AuthNotifier(ref.watch(authServiceProvider)));

class AuthNotifier extends StateNotifier<bool> with Toast {
  final AuthService _authService;
  AuthNotifier(this._authService) : super(false);
  login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      state = true;
      await _authService.login(email, password).then((value) {
        if ( value == "Succesfull") {
            // final box = GetStorage();
            //box.write('token', value.jwtTokenString);
            //print(box.read('token'));
            showCustom(context, "green", "Succesfully login");

            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
      
        } else if (value == "user not found") {
          showCustom(context, "red", "User Not Found ");
        } else {
          showCustom(context, "red", value);
        }
      });
      state = false;
    } catch (e) {
      state = false;
    }
  }
}
