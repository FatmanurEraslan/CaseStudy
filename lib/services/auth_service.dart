import 'dart:convert';
import 'package:case_study/core/cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

final authServiceProvider = Provider<AuthService>((ref)=>AuthService());

class AuthService with CacheManager{
  bool isLoggedIn =false;
  Future<String> login(String email, String password) async {
    final response = await post(
      Uri.parse('https://reqres.in/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      String token = json.decode(response.body)['token'];
      saveToken(token!);
      isLoggedIn=true;
      return "Succesfull";
    } 
    else if (response.statusCode == 400) {
      String error = json.decode(response.body)['error'];
      return error;
    } 
    else {
      throw Exception('Failed to load data!');
    }
  }


  
}
