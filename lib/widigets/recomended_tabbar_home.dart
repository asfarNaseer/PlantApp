import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      //color: Colors.blue,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                    height: 180.h,
                    width: 190,
                    // color: Colors.green,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 180,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: ClipPath(
                              clipper: CustomClipPath(),
                              child: Container(
                                width: MediaQuery.of(context).size.width.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffc1dfcb),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: -5,
                          top: -10,
                          child: Image(
                            image: AssetImage(
                              'assets/img/leaf2.png',
                            ),
                            height: 180,
                            width: 180,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Stack(
              children: [
                SizedBox(
                    height: 180.h,
                    width: 190,
                    // color: Colors.green,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 180,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: ClipPath(
                              clipper: CustomClipPath(),
                              child: Container(
                                width: MediaQuery.of(context).size.width.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffc1dfcb),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: -5,
                          top: -10,
                          child: Image(
                            image: AssetImage(
                              'assets/img/leaf2.png',
                            ),
                            height: 180,
                            width: 180,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Stack(
              children: [
                SizedBox(
                    height: 180.h,
                    width: 190,
                    // color: Colors.green,
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 180,
                            width: 170,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: ClipPath(
                              clipper: CustomClipPath(),
                              child: Container(
                                width: MediaQuery.of(context).size.width.w,
                                height: 100.h,
                                decoration: BoxDecoration(
                                  color: const Color(0xffc1dfcb),
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Positioned(
                          left: -5,
                          top: -10,
                          child: Image(
                            image: AssetImage(
                              'assets/img/leaf2.png',
                            ),
                            height: 180,
                            width: 180,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

////////////////clip- path/////////

class CustomClipPath extends CustomClipper<Path> {
  var radius = 15.0;

  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.lineTo(0, size.height);
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
