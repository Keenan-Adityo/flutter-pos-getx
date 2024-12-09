import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLogged = false.obs;

  void login(String username, String password) {
    if (username.isNotEmpty && password.isNotEmpty) {
      isLogged.value = true;
      Get.offAllNamed('/dashboard');
      Get.snackbar('Login Berhasil', 'Selamat datang $username');
    } else {
      Get.snackbar('Error', 'mohon isi username dan password');
    }
  }

  void logout() {
    Get.offAllNamed('/');
    Get.snackbar('Logout Berhasil', 'Selamat tinggal');
  }
}
