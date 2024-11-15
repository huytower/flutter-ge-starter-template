import 'package:data/network/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  var isLoading = false.obs;

  // Login function
  Future<void> login(String username, String password) async {
    isLoading(true); // Start loading
    try {
      // API request
      var response = await APIService.instance.request(
        '/api/login',
        DioMethod.post,
        param: {'username': username, 'password': password},
        contentType: 'application/json',
      );

      if (response.statusCode == 200) {
        // Successful login
        isLoggedIn(true);
        showSnackbar('Success', 'Login successful');
      } else {
        // Handle unexpected response status
        showSnackbar('Error', 'Invalid credentials');
      }
    } catch (e) {
      if (e is DioException) {
        // Handle Dio errors
        var errorMessage = e.response?.data?['error'] ?? 'An unknown error occurred';
        showSnackbar('Error', errorMessage);
      } else {
        // Handle other types of errors
        showSnackbar('Error', 'Something went wrong');
      }
    } finally {
      isLoading(false); // Stop loading
    }
  }

  void showSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }
}
