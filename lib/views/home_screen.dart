import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:plantation_app/widigets/recomended_tabbar_home.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: const Image(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          image: AssetImage('assets/img/leaf.jpg'))),
                ),
                const Icon(Icons.shopping_cart),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: Text(
              "let's find your",
              style: TextStyle(
                  color: const Color.fromARGB(255, 19, 78, 19),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: Text(
              "plants!",
              style: TextStyle(
                  color: const Color.fromARGB(255, 19, 78, 19),
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp),
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  //fillColor: Colors.grey,
                  filled: true,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color.fromARGB(255, 19, 78, 19),
                  ),
                  hintText: 'Search plant',
                  hintStyle: TextStyle(fontSize: 18.sp
                      // color: Color.fromARGB(255, 19, 78, 19),
                      ),
                  suffix: const Icon(Icons.keyboard_voice_rounded)),
              onTap: () {},
            ),
          ),
          DefaultTabController(
            length: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 20.h,
                    child: TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                            color: const Color(0xffc1dfcb),
                            borderRadius: BorderRadius.circular(20.r)),
                        tabs: const [
                          Tab(
                            text: 'recomended',
                          ),
                          Tab(
                            text: 'top',
                          ),
                          Tab(text: 'indoore'),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 200.h,
                  child: TabBarView(children: [
                    const Recommended(),
                    Container(
                      height: 100.h,
                      width: double.infinity,
                      color: Colors.amberAccent,
                    ),
                    Container(
                      height: 100.h,
                      width: double.infinity,
                      color: Colors.red,
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Recent viewed',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 19, 78, 19),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(
                        height: 70.h,
                        width: 200.w,
                        //  color: Colors.red,
                        child: Row(
                          children: [
                            Image(
                              height: 50.h,
                              width: 80.w,
                              image: const AssetImage(
                                'assets/img/leaf.jpg',
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Calathea',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        const Color.fromARGB(255, 19, 78, 19),
                                  ),
                                ),
                                const Text(
                                  "its spines don't grow",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 19, 78, 19),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                        width: 200.w,
                        //  color: Colors.red,
                        child: Row(
                          children: [
                            Image(
                              height: 50.h,
                              width: 80.w,
                              image: const AssetImage(
                                'assets/img/leaf.jpg',
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Calathea',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        const Color.fromARGB(255, 19, 78, 19),
                                  ),
                                ),
                                const Text(
                                  "its spines don't grow",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 19, 78, 19),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
