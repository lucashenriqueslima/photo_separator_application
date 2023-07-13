import 'package:get/get.dart';
import 'package:photo_separator/app/data/models/event_model.dart';
import 'package:photo_separator/app/data/repositories/event_repository.dart';

class EventDetailController extends GetxController {
  final EventRepository _repository = EventRepository();

  final id = Get.parameters['id'];

  final event = Event().obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getEvent();
  }

  Future<void> getEvent() async {
    final response = await _repository.getEventById(id!);
    event.value = Event.fromJson(response.data['data']);
  }
}
