import 'package:get/get.dart';

class IssueController extends GetxController {
  RxString title = ''.obs;
  RxString description = ''.obs;
  RxString location = ''.obs;
  Rx<String?> image = Rx<String?>(null);
  RxList<String> issues = <String>[].obs;

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

  // Function to fetch list of issues from API
  Future<void> fetchIssues() async {
    try {
      // Placeholder: Replace this with your API endpoint for fetching issues
      // Make API request to get a list of issues
      List<String> fetchedIssues = await _fetchIssuesFromApi();

      // Update the 'issues' list with the fetched data
      issues.assignAll(fetchedIssues);
    } catch (e) {
      print('Error fetching issues: $e');
      Get.snackbar('Error', 'Failed to fetch issues');
    }
  }

  // Placeholder for API call (replace this with your actual API call logic)
  Future<List<String>> _fetchIssuesFromApi() async {
    // Simulate API call delay (replace this with your actual API request)
    await Future.delayed(Duration(seconds: 2));

    // Simulated list of fetched issues (replace this with your actual API response)
    return [
      'Issue 1',
      'Issue 2',
      'Issue 3',
      // Add more issues as needed from the API response
    ];
  }
}
