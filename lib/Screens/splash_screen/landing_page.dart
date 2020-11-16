import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/Screens/sign_in_options/sign_in_screen/signin.dart';
import 'package:udemy_clone/widgets/landing_page_custom-button.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
            image: AssetImage('assets/landingPageBg1.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                LandingPageButton(
                  onpressed: () {},
                  title: 'Browse',
                ),
                Text(
                  '|',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                LandingPageButton(
                  onpressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        child: SignIn(),
                        type: PageTransitionType.leftToRight,
                      ),
                    );
                  },
                  title: 'SignIn',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
