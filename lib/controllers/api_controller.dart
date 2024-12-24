// // import 'package:app_parc/home_page.dart';

// //  Flutter/Flutter_Auth_Guide/lib
// // import 'package:app_parc/view/auth/signin_view.dart';
// // import 'package:dio/dio.dart';
// // import 'package:get/get.dart';
// // import 'package:get_storage/get_storage.dart';

// // class ApiController extends GetxController {
// //   final dio = Dio();
// //   List data = [];

// //   Future verifieLogin() {
// //     return token ? HomePage() : SignInView();
// //   }

// //   Future apiLogin() async {
// //     final box = GetStorage();
// //     box.write('emailUser', emailUser.text.toString());
// //     box.write('passUser', passUser.text.toString());

// //     final response = await dio.post('http://192.168.1.107:80/api/login',
// //         data: userformData,
// //         options: Options(headers: {
// //           "Content-Type": "application/json",
// //           "Accept": "application/json"
// //         }));
// //     data.add(response);
// //     print(box.read('emailUser'));
// //     print(box.read('passUser'));
// //     //await prefs.setString('erer', response as String);
// //   }

// //   Future apiRester() async {
// //     final response = await dio.post('http://192.168.1.107:80/api/register',
// //         data: saveformData,
// //         options: Options(headers: {
// //           "Content-Type": "application/json",
// //           "Accept": "application/json"
// //         }));
// //     print(response);
// //   }
// // }

//     Future<Response> registerUser() async {
//         //IMPLEMENT USER REGISTRATION
//     }

//     Future<Response> login() async {
//         //IMPLEMENT USER LOGIN
//     }

//     Future<Response> getUserProfileData() async {
//         //GET USER PROFILE DATA
//     }

//     Future<Response> logout() async {
//         //IMPLEMENT USER LOGOUT
//      }

//      Future<Response> registerUser(Map<String, dynamic>? userData) async {
//         try {
//           Response response = await _dio.post(
//               'https://api.loginradius.com/identity/v2/auth/register',  //ENDPONT URL
//               data: userData, //REQUEST BODY
//               queryParameters: {'apikey': 'YOUR_API_KEY'},  //QUERY PARAMETERS
//               options: Options(headers: {'X-LoginRadius-Sott': 'YOUR_SOTT_KEY', //HEADERS
//           }));
//           //returns the successful json object
//           return response.data;
//         } on DioError catch (e) {
//           //returns the error object if there is
//           return e.response!.data;
//         }
//       }
//     }

//     Future<Response> login(String email, String password) async {
//         try {
//           Response response = await _dio.post(
//             'https://api.loginradius.com/identity/v2/auth/login',
//             data: {
//               'email': email,
//               'password': password
//             },
//             queryParameters: {'apikey': 'YOUR_API_KEY'},
//           );
//           //returns the successful user data json object
//           return response.data;
//         } on DioError catch (e) {
//           //returns the error object if any
//           return e.response!.data;
//         }
//       }
//     }

//      Future<Response> getUserProfileData(String accesstoken) async {
//         try {
//           Response response = await _dio.get(
//             'https://api.loginradius.com/identity/v2/auth/account',
//             queryParameters: {'apikey': 'YOUR_API_KEY'},
//             options: Options(
//               headers: {
//                 'Authorization': 'Bearer ${YOUR_ACCESS_TOKEN}',
//               },
//             ),
//           );
//           return response.data;
//         } on DioError catch (e) {
//           return e.response!.data;
//         }
//     }

//     Future<Response> logout(String accessToken) async {
//         try {
//           Response response = await _dio.get(
//             'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
//             queryParameters: {'apikey': ApiSecret.apiKey},
//             options: Options(
//               headers: {'Authorization': 'Bearer $accessToken'},
//             ),
//           );
//           return response.data;
//         } on DioError catch (e) {
//           return e.response!.data;
//         }
//       }
//     }
