import 'package:get/get.dart';

import 'event_detail_controller.dart';

class EventDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventDetailController>(
      () => EventDetailController(),
    );
  }
}
