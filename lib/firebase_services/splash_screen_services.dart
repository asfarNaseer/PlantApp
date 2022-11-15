import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:plantation_app/views/auth/login_screen.dart';
import 'package:plantation_app/views/navigation_screen.dart';

class SplashServices {
  void isLogin() {
    late FirebaseAuth auth = FirebaseAuth.instance;
    late User? user = auth.currentUser;
    if (user == null) {
      Timer(const Duration(seconds: 3), () {
        Get.to(LogInScreen());
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.to(NavigationBarScreen());
      });
    }
  }
}
