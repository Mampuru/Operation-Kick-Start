import 'package:get/get.dart';

class SignInController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var name = ''.obs;


  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  Future<void> sign() async {
    // Implement your login logic here
    // Example: Authenticate user with email and password
    // Call API, validate credentials, etc.
    try {
      // Placeholder for login logic
      // Check if email and password are valid
      if (email.value == 'example@email.com' && password.value == 'password') {
        // Successful login
        // Navigate to the next screen or perform further actions
        Get.toNamed('/home'); // Example: Navigate to home screen
      } else {
        // Invalid credentials
        Get.snackbar('Error', 'Invalid email or password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while logging in');
    }
  }

  Future<void> signUp() async {
    // Implement your sign logic here
    // Example: Authenticate user with email and password
    // Call API, validate credentials, etc.
    try {
      // Placeholder for logic logic
      // Check if email and password are valid

    } catch (e) {
      Get.snackbar('Error', 'An error occurred while signing up');
    }
  }
}
