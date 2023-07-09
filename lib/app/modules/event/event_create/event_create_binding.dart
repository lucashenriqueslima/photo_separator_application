import 'package:get/get.dart';
import 'package:photo_separator/app/modules/event/event_create/event_create_controller.dart';

class EventCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventCreateController>(
      () => EventCreateController(),
    );
  }
}
