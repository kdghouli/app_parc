import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';
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
      body: jsonEncode({'email': mail, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );
    isLoading.value = false;

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(response.body);
      storage.write('loggedIn', true);
      storage.write('data', data);
      // storage.write('token_type', data['token_type']);
      // storage.write('user', data['user']);

      isLoggedIn.value = true;
      Get.snackbar("Success", "Login successful");
    } else {
      Get.snackbar("Error", "Invalid Mail or Password");
    }
  }

  void logout() {
    storage.write('loggedIn', false);
    storage.remove('data');
    isLoggedIn.value = false;
  }
}
