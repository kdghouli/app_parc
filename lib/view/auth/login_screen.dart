// import 'package:app_parc/controllers/login_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginScreen extends StatelessWidget {
//   LoginScreen({super.key});

//   //final LoginController loginController = Get.put(LoginController());
//   final TextEditingController mailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (loginController.isLoggedIn.value) {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Home'),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.logout),
//                 onPressed: loginController.logout,
//               ),
//             ],
//           ),
//           body: Center(
//             child: Text(loginController.storage.read('data').toString()),
//           ),
//         );
//       } else {
//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Login'),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 TextField(
//                   controller: mailController,
//                   decoration: InputDecoration(labelText: 'Mail'),
//                 ),
//                 TextField(
//                   controller: passwordController,
//                   decoration: InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 30),
//                 Obx(() {
//                   if (loginController.isLoading.value) {
//                     return CircularProgressIndicator();
//                   } else {
//                     return ElevatedButton(
//                       onPressed: () {
//                         loginController.login(
//                           mailController.text,
//                           passwordController.text,
//                         );
//                       },
//                       child: Text('Login'),
//                     );
//                   }
//                 }),
//               ],
//             ),
//           ),
//         );
//       }
//     });
//   }
// }
