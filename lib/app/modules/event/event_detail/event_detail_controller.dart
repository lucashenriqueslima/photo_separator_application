import 'package:get/get.dart';
import 'package:photo_separator/app/data/repositories/event_repository.dart';

class EventDetailController extends GetxController {
  final EventRepository _repository = EventRepository();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    _repository.getEventById('1').then((value) => print(value));
  }

  void increment() => count.value++;
}
