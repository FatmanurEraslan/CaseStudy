import 'package:case_study/constant.dart';
import 'package:case_study/core/auth_manager.dart';
import 'package:case_study/notifier/auth_notifier.dart';
import 'package:case_study/screens/home/components/body.dart';
import 'package:case_study/screens/sign_in/sign_in_screen.dart';
import 'package:case_study/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppBar(context),
      extendBodyBehindAppBar: true,
      body: Body(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      automaticallyImplyLeading: false, // Geri butonunu devre dışı bırak
      title: const Text(
        "User List",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.logout, color: Colors.white),
        onPressed: () {
                       Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignInScreen()));
          Consumer(builder: (context, ref, _) {
  
            ref.read(AuthProvider).signout();
            bool isLogin = ref.read(AuthProvider).isLogin;
            if (isLogin == false) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignInScreen()));
            }
            return const CircularProgressIndicator();
          });
        },
      ),
    );
  }
}
