import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantation_app/views/auth/login_screen.dart';

import '../utils/utiles.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final auth = FirebaseAuth.instance;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: InkWell(
            onTap: () async {
              try {
                await auth.signOut().then((value) {
                  Get.to(LogInScreen());
                  setState(() {
                    loading = true;
                  });
                });
              } on FirebaseAuthException catch (e) {
                Utils().toastMessage(e.message.toString());
                setState(() {
                  loading = false;
                });
              }
            },
            child: loading
                ? const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.red,
                  )
                : Text('Logout')),
      ),
    ));
  }
}
