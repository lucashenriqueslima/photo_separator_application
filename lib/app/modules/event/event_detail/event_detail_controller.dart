import 'package:desktop_drop/desktop_drop.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/data/models/event_identification_model.dart';
import 'package:photo_separator/app/data/models/event_image_model.dart';
import 'package:photo_separator/app/data/models/event_model.dart';
import 'package:photo_separator/app/data/repositories/event_repository.dart';

class EventDetailController extends GetxController {
  final EventRepository _repository = EventRepository();

  final id = Get.parameters['id'];

  final event = Event().obs;

  final dropZoneIdenficationIsHovered = false.obs;

  final dropZonePhotosIsHovered = false.obs;

  final RxList<EventIdentification> eventIdentfications =
      <EventIdentification>[].obs;

  final RxList<EventImage> evnentImages = <EventImage>[].obs;

  @override
  void onInit() {
    super.onInit();
    getEvent();
  }

  Future<void> getEvent() async {
    final response = await _repository.getEventById(id!);
    event.value = Event.fromJson(response.data['data']);
  }

  Future<void> addEventIdentification(DropDoneDetails details) async {
    for (final file in details.files) {
      if (file.type == 'image') {
        final response = await _repository.addEventIdentification(
          id!,
          file.name,
          file.bytes,
        );
        eventIdentfications
            .add(EventIdentification.fromJson(response.data['data']));
      }
    }
  }
}
