import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:plantation_app/utils/utiles.dart';
import 'package:plantation_app/views/auth/siginup_screen.dart';
import 'package:plantation_app/views/home_screen.dart';
import 'package:plantation_app/views/navigation_screen.dart';

class LogInScreen extends StatefulWidget {
  LogInScreen({
    super.key,
  });

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool loading = false;
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool? checkboxvalue = false;

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              ClipPath(
                clipper: CustomClipPath(),
                child: Container(
                  width: double.infinity,
                  height: 230.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/leaf.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 35.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 50.h),
                  Column(
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.sp),
                      ),
                      Text(
                        'Login to your account',
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
                        height: 80.h,
                        image: const AssetImage('assets/img/leaf2.png')),
                  )
                ],
              ),
              SizedBox(
                height: 35.h,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey,
                            filled: true,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Color.fromARGB(255, 19, 78, 19),
                            ),
                            hintText: 'Email',
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
                          keyboardType: TextInputType.text,
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
                              return 'Enter Password';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      value: checkboxvalue,
                      onChanged: (newValue) {
                        setState(() {
                          checkboxvalue = newValue;
                        });
                      },
                    ),
                    const Text('remember me'),
                    const Spacer(),
                    const Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 19, 78, 19),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () async {
                  if (_formkey.currentState!.validate()) {
                    setState(() {
                      loading = true;
                    });
                  }
                  ;
                  try {
                    await _auth
                        .signInWithEmailAndPassword(
                            email: emailController.text.toString(),
                            password: passwordController.text.toString())
                        .then((value) {
                      setState(() {
                        loading = false;
                        Get.to(NavigationBarScreen());
                      });
                    });
                  } on FirebaseAuthException catch (e) {
                    Utils().toastMessage(e.message.toString());
                    setState(() {
                      loading = false;
                    });
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
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
                              'Log In',
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
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have account?",
                    style: TextStyle(color: Color(0xff9e9e9e)),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const SignUp());
                    },
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                          color: Color.fromARGB(255, 19, 78, 19),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////clip path classs ////////////

class CustomClipPath extends CustomClipper<Path> {
  var radius = 15.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 4, size.height - 40, size.width / 2, size.height - 20);
    path.quadraticBezierTo(
        3 / 4 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
