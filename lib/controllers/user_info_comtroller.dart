import 'package:get/get.dart';

class UserInfoController extends GetxController {
  RxString name = ''.obs;
  RxString email = ''.obs;
  RxString location = ''.obs;
  RxString password = ''.obs;

  void setName(String value) => name.value = value;
  void setEmail(String value) => email.value = value;
  void setLocation(String value) => location.value = value;
  void setPassword(String value) => password.value = value;

  // Function to update user info
  void updateUserInfo() {
    if (name.value.isEmpty || email.value.isEmpty || location.value.isEmpty || password.value.isEmpty) {
      // Show error message if any field is empty
      Get.snackbar('Error', 'All fields are required');
      return;
    }

    // Placeholder: Replace this with your user info update logic (API call, etc.)
    print('Updating user info...');
    print('Name: ${name.value}');
    print('Email: ${email.value}');
    print('Location: ${location.value}');
    print('Password: ${password.value}');

    // Reset input fields after updating user info
    name.value = '';
    email.value = '';
    location.value = '';
    password.value = '';

    // Show success message
    Get.snackbar('Success', 'User info updated successfully');
  }
}
