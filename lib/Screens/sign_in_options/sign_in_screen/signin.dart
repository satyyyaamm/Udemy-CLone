import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:udemy_clone/Screens/home_screen/home_screen.dart';
import 'package:udemy_clone/Screens/sign_in_options/Sign_in_with_emailandpassword/Sign_in_with_email_and_password.dart';
import 'package:udemy_clone/Screens/sign_in_options/sign_up_screen/signup.dart';
import 'package:udemy_clone/services/Google_authentication.dart';
import 'package:udemy_clone/widgets/create_new_account.dart';
import 'package:udemy_clone/widgets/ordivider.dart';
import 'package:udemy_clone/widgets/signin_option_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authentication authentication = Authentication();
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign in',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w300,
                    color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SignInOptionsButton(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 81),
                  title: 'Sign in with email',
                  icon: Icon(
                    EvaIcons.emailOutline,
                    color: Colors.red,
                  ),
                  onpressed: () {
                    Get.to(SignInWithEmailAndPassword(),
                        transition: Transition.upToDown);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: ORdivider(),
              ),
              SignInOptionsButton(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 78),
                title: 'Sign in with Google',
                icon: Icon(EvaIcons.google),
                onpressed: () async {
                  await Authentication().googlesignin().whenComplete(() {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                          child: HomeScreen(),
                          type: PageTransitionType.rightToLeft),
                    );
                  });
                },
              ),
              SignInOptionsButton(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                title: 'Sign in with Facebook',
                icon: Icon(EvaIcons.facebook),
                onpressed: () {},
              ),
              SignInOptionsButton(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 83),
                title: 'Sign in with Apple',
                icon: Icon(FontAwesomeIcons.apple),
                onpressed: () {},
              ),
              CreateNewAccount(
                title: 'New Here ?',
                title2: ' Create an account',
                onpressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: SignUp(), type: PageTransitionType.rightToLeft),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
