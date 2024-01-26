import 'package:case_study/size_config.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
        SizeConfig().init(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
              30.0), // İstediğiniz yüksekliği burada belirleyebilirsiniz
          child: AppBar(
    )
          
          ),
      body: Body(),

    );
  }
}
