import 'package:app_parc/constant.dart';
import 'package:app_parc/home_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController {
  final dio = Dio();
  final storage = GetStorage();
  var isLoading = false;
  var isLoggedIn = false;

  @override
  void onInit() {
    super.onInit();
    isLoggedIn = storage.read('loggedIn') ?? false;
  }

  Future<void> login(String mail, String password) async {
    isLoading = true;
    final response = await dio.post('$url/api/login',
        data: ({'email': mail, 'password': password}),
        options: Options(headers: {'Content-Type': 'application/json'}));
    isLoading = false;

    if (response.statusCode == 200) {
      final data = response.data;
      print(response.data);
      storage.write('loggedIn', true);
      storage.write('data', data);
      // storage.write('token_type', data['token_type']);
      // storage.write('user', data['user']);
      update();
      isLoggedIn = true;
      Get.snackbar("Success", "Login successful $mail");
      Get.off(() => HomePage());
    } else {
      Get.snackbar("Error", "Invalid Mail or Password");
      mail = "";
      password = "";
    }
  }

  void logout() {
    storage.write('loggedIn', false);
    storage.remove('data');
    isLoggedIn = false;
    update();
  }

  Future saveUser(String name, String mail, String password) async {
    isLoading = true;
    final response = await dio.post('$url/api/register',
        data: ({'name': name, 'email': mail, 'password': password}),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }));
    isLoading = false;

    if (response.statusCode == 200) {
      final data = response.data;
      print(response.data);
      storage.write('loggedIn', true);
      storage.write('data', data);
      // storage.write('token_type', data['token_type']);
      // storage.write('user', data['user']);
      isLoggedIn = true;
      update();
      Get.snackbar("Success", "Login bien créer");
      Get.back();
    } else {
      Get.snackbar("Error", "Récreer ");
    }
  }
}
