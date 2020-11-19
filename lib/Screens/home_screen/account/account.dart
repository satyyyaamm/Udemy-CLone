import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/Screens/splash_screen/Splash_screen.dart';
import 'package:udemy_clone/Screens/splash_screen/landing_page.dart';
import 'package:udemy_clone/services/Firebase_controller.dart';
import 'package:udemy_clone/services/Google_authentication.dart';
import 'package:udemy_clone/services/storage.dart';
import 'package:udemy_clone/widgets/optionCustomListTile.dart';
import 'package:udemy_clone/widgets/optionHeadingText.dart';

// ignore: must_be_immutable
class Account extends GetWidget<FirebaseController> {
  SecureStorage secureStorage = SecureStorage();
  Authentication authentication = Authentication();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Account',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.w300),
        ),
        actions: [
          IconButton(
            icon: Icon(EvaIcons.shoppingCartOutline, size: 30),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    finalName,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(EvaIcons.google, color: Colors.white),
                        SizedBox(width: 7),
                        Text(
                          finalEmail,
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: MaterialButton(
                      onPressed: () {},
                      child: Text(
                        'Become an Instructor',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.lightBlueAccent,
                            fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            ),
            OptionHeadingText(title: 'Video Preferences'),
            OptionCustomListTile(
              onpressed: () {},
              title: 'Download Options',
            ),
            OptionCustomListTile(
              onpressed: () {},
              title: 'Video playback options',
            ),
            OptionHeadingText(title: 'Account settings'),
            OptionCustomListTile(
              onpressed: () {},
              title: 'Account security',
            ),
            OptionCustomListTile(
              onpressed: () {},
              title: 'Email notification preferences',
            ),
            OptionCustomListTile(
              onpressed: () {},
              title: 'Learning reminder',
            ),
            OptionHeadingText(title: 'Support'),
            OptionCustomListTile(
              onpressed: () {},
              title: 'About udemy',
            ),
            OptionCustomListTile(
              onpressed: () {},
              title: 'About udemy for business',
            ),
            OptionCustomListTile(
              onpressed: () {},
              title: 'Frequently asked questions',
            ),
            OptionCustomListTile(
              onpressed: () {},
              title: 'Share the udemy app',
            ),
            OptionHeadingText(title: 'diagnostics'),
            OptionCustomListTile(
              onpressed: () {},
              title: 'Status',
            ),
            Center(
              child: MaterialButton(
                onPressed: () async {
                  await authentication
                      .googleSignOut()
                      .whenComplete(
                          () => secureStorage.deleteSecureData('email'))
                      .whenComplete(
                        () => Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: LandingPage(),
                              type: PageTransitionType.bottomToTop),
                        ),
                      );
                  signOut();
                },
                child: Text(
                  'Sign out',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.lightBlueAccent,
                      fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Center(
                child: Text(
                  'Udemy clone v1.0.',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void signOut() {
    controller.signout();
  }
}
