import 'package:get/get.dart';
import 'package:kardusinfo_todo/presentation/feature/signup/controller/signup_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
