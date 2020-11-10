import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:udemy_clone/widgets/create_new_account.dart';
import 'package:udemy_clone/widgets/ordivider.dart';
import 'package:udemy_clone/widgets/signin_option_button.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
                ' Create and account',
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
                  onpressed: () {},
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
                onpressed: () {},
              ),
              SignInOptionsButton(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 70),
                title: 'Sign in with Facebook',
                icon: Icon(EvaIcons.facebook),
                onpressed: () {},
              ),
              CreateNewAccount(
                title: 'Already have an account ?',
                title2: ' Sign In',
                onpressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
