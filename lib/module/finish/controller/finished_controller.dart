import 'package:get/get.dart';

class FinishedController extends GetxController {
  // Define any observable variables
  var isLoading = false.obs;

  // Example data list
  var finishedItems = <String>[].obs;

  // Fetch finished items (mock example)
  void fetchFinishedItems() async {
    isLoading.value = true;
    try {
      // Simulate a delay for fetching data
      await Future.delayed(Duration(seconds: 2));
      finishedItems.value = ['Task 1', 'Task 2', 'Task 3'];
    } finally {
      isLoading.value = false;
    }
  }

  // Add a new finished item
  void addFinishedItem(String item) {
    finishedItems.add(item);
  }

  // Remove a finished item
  void removeFinishedItem(String item) {
    finishedItems.remove(item);
  }
}
