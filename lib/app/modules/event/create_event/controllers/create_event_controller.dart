
import 'package:get/get.dart';
import 'package:photo_separator/app/data/repositories/event_repository.dart';

class CreateEventController extends GetxController {
  final EventRepository repository;

  CreateEventController(this.repository);

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
