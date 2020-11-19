import 'package:get/get.dart';
import 'package:udemy_clone/services/Firebase_controller.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseController>(() => FirebaseController());
  }
}
