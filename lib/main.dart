import 'package:case_study/routs.dart';
import 'package:case_study/screens/splash/splash_screen.dart';
import 'package:case_study/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {    
    return MaterialApp(
      title: 'Case Study',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const SplashScreen(),
      routes: routes,
    );
  }
}
