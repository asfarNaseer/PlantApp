import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plantation_app/utils/utiles.dart';
import 'package:plantation_app/views/auth/login_screen.dart';
import 'package:plantation_app/views/home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 19, 78, 19),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 60.h),
              Column(
                children: [
                  Text(
                    'Register',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
                  ),
                  Text(
                    'create your new account',
                    style: TextStyle(
                        color: const Color(0xff9e9e9e),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
              RotationTransition(
                turns: const AlwaysStoppedAnimation(-50 / 360),
                child: Image(
                    height: 90.h,
                    image: const AssetImage('assets/img/leaf2.png')),
              ),
            ],
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 19, 78, 19),
                      ),
                      hintText: 'Full Name',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 19, 78, 19),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Full Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 19, 78, 19),
                      ),
                      hintText: 'email@gmail.com',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 19, 78, 19),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter Email';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.grey,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock_sharp,
                        color: Color.fromARGB(255, 19, 78, 19),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 19, 78, 19),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter password';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'By signing you agree to our',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 19, 78, 19),
                ),
              ),
              Text(
                ' Team of use ',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xff9e9e9e)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'and',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 19, 78, 19),
                ),
              ),
              Text(
                ' privacy notice',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Color(0xff9e9e9e)),
              )
            ],
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: InkWell(
              onTap: () async {
                if (_formkey.currentState!.validate()) {
                  setState(() {
                    loading = true;
                  });
                }
                ;
                try {
                  await _auth
                      .createUserWithEmailAndPassword(
                          email: emailController.text.toString(),
                          password: passwordController.text.toString())
                      .then((value) {
                    setState(() {
                      loading = false;
                      Get.to(Home());
                    });
                    // log("created");
                  });
                } on FirebaseAuthException catch (e) {
                  Utils().toastMessage(e.message.toString());
                  setState(() {
                    loading = false;
                  });
                }
                // Get.to(NavigationBarScreen());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 19, 78, 19),
                    borderRadius: BorderRadius.circular(30.r)),
                height: 50.h,
                width: double.infinity,
                child: Center(
                  child: loading
                      ? const CircularProgressIndicator(
                          strokeWidth: 3,
                          color: Colors.white,
                        )
                      : const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have an account?",
                style: TextStyle(color: Color(0xff9e9e9e)),
              ),
              InkWell(
                onTap: () {
                  Get.to(LogInScreen());
                },
                child: const Text(
                  'LogIn',
                  style: TextStyle(
                      color: Color.fromARGB(255, 19, 78, 19),
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(height: 50.h)
        ],
      ),
    ));
  }
}
