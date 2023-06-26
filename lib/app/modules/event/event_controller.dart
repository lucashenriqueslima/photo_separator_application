import 'package:get/get.dart';

class EventController extends GetxController {
  //TODO: Implement EventController

  final count = 0.obs;
  final currentIndex = 0.obs;


  changeIndex (int index) {
    currentIndex.value = index;
  }



  void increment() => count.value++;
}
