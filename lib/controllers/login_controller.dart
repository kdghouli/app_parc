import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginController extends GetxController {
  final storage = GetStorage();
  var isLoading = false.obs;
  var isLoggedIn = false.obs;

  @override
  void onInit() {
    super.onInit();
    isLoggedIn.value = storage.read('loggedIn') ?? false;
  }

  Future<void> login(String mail, String password) async {
    isLoading.value = true;
    final response = await http.post(
      Uri.parse('http://192.168.1.107:80/api/login'),
      body: jsonEncode({'mail': mail, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    isLoading.value = false;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      storage.write('loggedIn', true);
      storage.write('token', data['token']);
      isLoggedIn.value = true;
      Get.snackbar("Success", "Login successful");
    } else {
      Get.snackbar("Error", "Invalid username or password");
    }
  }

  void logout() {
    storage.write('loggedIn', false);
    storage.remove('token');
    isLoggedIn.value = false;
  }
}