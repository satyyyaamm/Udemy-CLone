import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/sign_in_options/Sign_in_with_emailandpassword/Custom_flat_button.dart';
import 'package:udemy_clone/Screens/sign_in_options/Sign_in_with_emailandpassword/Custom_input.dart';
import 'package:udemy_clone/Screens/sign_in_options/Sign_in_with_emailandpassword/Heading_for_sign_in.dart';
import 'package:udemy_clone/services/Firebase_controller.dart';

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

final GlobalKey<FormState> nameformKey = GlobalKey<FormState>();
final GlobalKey<FormState> emailformKey = GlobalKey<FormState>();
final GlobalKey<FormState> passwordformKey = GlobalKey<FormState>();

class CreateAccountPage extends GetWidget<FirebaseController> {
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeadingForSignIn(
                  title1: 'Create an account',
                  hastitle2: false,
                ),
                Form(
                  key: nameformKey,
                  child: CustomInput(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    validator: (value) {
                      if (nameController.text.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    labelText: 'Name',
                    controller: nameController,
                    obscureText: false,
                  ),
                ),
                Form(
                  key: emailformKey,
                  child: CustomInput(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    validator: (value) {
                      if (emailController.text.isEmpty) {
                        return 'Please enter your an email';
                      }
                      return null;
                    },
                    labelText: 'Email',
                    controller: emailController,
                    obscureText: false,
                  ),
                ),
                Form(
                  key: passwordformKey,
                  child: CustomInput(
                    padding: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    validator: (value) {
                      if (passwordController.text.length <= 7) {
                        return 'Password must be 7+ letters';
                      }
                      return null;
                    },
                    labelText: 'Password',
                    controller: passwordController,
                    obscureText: true,
                  ),
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
                        title: 'Have an account? \n Sign in',
                      ),
                      CustomFlatButton(
                        fontsize: 16,
                        titleColor: Colors.black,
                        color: Colors.white,
                        padding: const EdgeInsets.only(),
                        onpressed: createAccount,
                        title: 'Create account',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'By clicking on "Create account" you agree to our terms of \n Use and Privacy Policy',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createAccount() {
    controller.createAccount(
        nameController.text, emailController.text, passwordController.text);
  }
}
