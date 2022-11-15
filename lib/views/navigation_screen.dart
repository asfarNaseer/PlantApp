import 'package:flutter/material.dart';
import 'package:plantation_app/views/chat_screen.dart';

import 'package:plantation_app/views/home_screen.dart';

import 'package:plantation_app/views/profile_screen.dart';
import 'package:plantation_app/views/shopping_cart_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int tabIndex = 0;
  changeIndex(int changeTabIndex) {
    setState(() {
      tabIndex = changeTabIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: tabIndex,
        selectedItemColor: const Color.fromARGB(255, 19, 78, 19),
        unselectedItemColor: const Color.fromARGB(255, 156, 170, 156),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: '',
            backgroundColor: Color(0XFFFFFFFF),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: '',
            backgroundColor: Color(0XFFFFFFFF),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            label: '',
            backgroundColor: Color(0XFFFFFFFF),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
              size: 30,
            ),
            label: '',
            backgroundColor: Color(0XFFFFFFFF),
          ),
        ],
      ),
      body: IndexedStack(
        index: tabIndex,
        children: [
          const Home(),
          ProfileScreen(),
          const ShoppingCart(),
          const ChatScreen(),
        ],
      ),
    );
  }
}
