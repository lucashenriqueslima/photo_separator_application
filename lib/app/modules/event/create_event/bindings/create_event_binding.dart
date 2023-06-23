
import 'package:get/get.dart';
import 'package:photo_separator/app/data/providers/my_api.dart';
import 'package:photo_separator/app/data/repositories/event_repository.dart';

import '../controllers/create_event_controller.dart';

class CreateEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateEventController>(
      () => CreateEventController(EventRepository(MyApi())),
    );
  }
}
