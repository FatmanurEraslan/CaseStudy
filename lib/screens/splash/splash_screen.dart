import 'package:case_study/constant.dart';
import 'package:case_study/core/auth_manager.dart';
import 'package:case_study/screens/home/home_screen.dart';
import 'package:case_study/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    controlToLogin();
  }

  Future<void> controlToLogin() async {
    await ref.read(AuthProvider).fetchUserLogin();
    if (ref.read(AuthProvider).isLogin) {
      await Future.delayed(const Duration(seconds: 3));
      //ref.read(AuthProvider).model = UserModel.fake();
      //context.navigation.popUntil((route) => false);
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      await Future.delayed(const Duration(seconds: 3));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => SignInScreen()));
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
      ),
      body: const Column(
        children: [
          Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Hoş Geldiniz!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
              )),
        ],
      ),
    );
  }
}
