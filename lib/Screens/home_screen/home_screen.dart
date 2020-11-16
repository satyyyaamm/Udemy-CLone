import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:udemy_clone/Screens/home_screen/account/account.dart';
import 'package:udemy_clone/Screens/home_screen/featured/featured.dart';
import 'package:udemy_clone/Screens/home_screen/mycourse/mycourses.dart';
import 'package:udemy_clone/Screens/home_screen/search/search.dart';
import 'package:udemy_clone/Screens/home_screen/wishlist/wishlist.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;
  FirebaseMessaging _firebaseMessaging;
  String _message;

  void onTap(int page) {
    setState(() {
      currentIndex = page;
    });
    pageController.jumpToPage(page);
  }

  // @override
  // void initState() {
  //   _firebaseMessaging.configure(
  //       onLaunch: (Map<String, dynamic> message) async {
  //     setState(() {
  //       _message = message['title'];
  //     });
  //     print(_message);
  //   }, onResume: (Map<String, dynamic> message) async {
  //     setState(() {
  //       _message = message['title'];
  //     });
  //     print(_message);
  //   }, onMessage: (Map<String, dynamic> message) async {
  //     setState(() {
  //       _message = message['title'];
  //     });
  //     print(_message);
  //   });

  //   _firebaseMessaging.getToken().then((value) => print(value));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        controller: pageController,
        children: [
          Featured(),
          Search(),
          MyCourse(),
          Wishlist(),
          Account(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Colors.redAccent),
        backgroundColor: Colors.grey.shade900,
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedLabelStyle: TextStyle(color: Colors.white),
        unselectedItemColor: Colors.white,
        iconSize: 26,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined), label: 'Featured'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.playCircle), label: 'My courses'),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.heartOutline), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}
