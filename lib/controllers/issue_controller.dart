import 'package:get/get.dart';

class IssueController extends GetxController {
  RxString title = ''.obs;
  RxString description = ''.obs;
  RxString location = ''.obs;
  Rx<String?> image = Rx<String?>(null);

  void setTitle(String value) => title.value = value;
  void setDescription(String value) => description.value = value;
  void setLocation(String value) => location.value = value;
  // Function to handle image selection (replace this with your image handling logic)
  void setImage(String imagePath) => image.value = imagePath;

  // Function to log the issue
  void logIssue() {
    if (title.value.isEmpty || description.value.isEmpty) {
      // Show error message if title or description is empty
      Get.snackbar('Error', 'Title and description are required');
      return;
    }

    // Placeholder: Replace this with your issue logging logic (API call, etc.)
    print('Logging issue...');
    print('Title: ${title.value}');
    print('Description: ${description.value}');
    print('Image: ${image.value ?? 'No image selected'}');

    // Reset input fields after logging issue
    title.value = '';
    description.value = '';
    image.value = null;

    // Show success message
    Get.snackbar('Success', 'Issue logged successfully');
  }
}
