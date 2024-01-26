import 'package:case_study/models/user_pagination_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'cache_manager.dart';

class AuthenticationManager with CacheManager {
  AuthenticationManager() {
    fetchUserLogin();
  }

  bool isLogin = false;
  User? model;

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }

  void signout() {
    logout();
    model = null;
    isLogin = false;
  }
}

final AuthProvider = Provider((ref) => AuthenticationManager());