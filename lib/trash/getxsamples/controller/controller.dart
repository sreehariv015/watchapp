import 'package:get/get.dart';
class LoginGetx extends GetxController {
  RxString name = ''.obs;
  RxString email = ''.obs;
  void handleLogin(String? name, String? email) {
    this.name.value = name!;
    this.email.value = email!;

    Get.snackbar(
      'Login Successful', // Title
      'Name: $name\nEmail: $email', // Message
    );
  }
}