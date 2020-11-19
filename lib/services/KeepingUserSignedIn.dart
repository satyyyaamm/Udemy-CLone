// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:udemy_clone/Screens/home_screen/home_screen.dart';
import 'package:udemy_clone/Screens/splash_screen/Splash_screen.dart';
import 'package:udemy_clone/services/Firebase_controller.dart';

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<FirebaseController>().user != null
          ? HomeScreen()
          : SplashScreen();
    });
  }
}
