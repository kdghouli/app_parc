import 'package:get/get.dart';

class TestGetxController extends GetxController {
  int counter = 6;

  int? icrementer() {
     counter++;
    update();
    
  }

  int? decrementer() {
     counter--;
    update();
  }
}
