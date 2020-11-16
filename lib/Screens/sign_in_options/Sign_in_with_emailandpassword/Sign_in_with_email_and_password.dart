import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/sign_in_options/Sign_in_with_emailandpassword/Custom_flat_button.dart';
import 'package:udemy_clone/Screens/sign_in_options/Sign_in_with_emailandpassword/Custom_input.dart';
import 'package:udemy_clone/Screens/sign_in_options/Sign_in_with_emailandpassword/Heading_for_sign_in.dart';

class SignInWithEmailAndPassword extends StatefulWidget {
  @override
  _SignInWithEmailAndPasswordState createState() =>
      _SignInWithEmailAndPasswordState();
}

class _SignInWithEmailAndPasswordState
    extends State<SignInWithEmailAndPassword> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
        body: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeadingForSignIn(
                title1: 'Welcome Back!',
                title2: 'Enter your email to sign in to your account',
              ),
              CustomInput(
                padding: const EdgeInsets.only(
                    top: 80, left: 20, right: 20, bottom: 10),
                validator: (value) {
                  if (emailController.text.isEmpty) {
                    return 'Please enter some email';
                  }
                  return null;
                },
                controller: emailController,
                obscureText: false,
                labelText: 'Email',
              ),
              CustomFlatButton(
                fontsize: 16,
                titleColor: Colors.black,
                color: Colors.white,
                padding: const EdgeInsets.only(left: 240, right: 20),
                title: 'Next',
                onpressed: () {
                  if (_formKey.currentState.validate()) {
                    Get.to(Password());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController passwordController = TextEditingController();

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
        body: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeadingForSignIn(
                title1: 'Almost there!',
                title2:
                    'Enter your password to sign on with \n Satyamt5152@gmail.com',
              ),
              CustomInput(
                padding: const EdgeInsets.only(
                    top: 80, left: 20, right: 20, bottom: 10),
                validator: (value) {},
                controller: passwordController,
                obscureText: true,
                labelText: 'Password',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomFlatButton(
                      fontsize: 14,
                      titleColor: Colors.white,
                      color: Colors.transparent,
                      padding: const EdgeInsets.only(),
                      onpressed: () {},
                      title: 'Forget Password?',
                    ),
                    CustomFlatButton(
                      fontsize: 16,
                      titleColor: Colors.black,
                      color: Colors.white,
                      padding: const EdgeInsets.only(),
                      title: 'Sign in',
                      onpressed: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'By clicking on "Sign in" you agree to our terms of \n Use and Privacy Policy',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
