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

  List permitedMimeTypes = ['image/jpeg', 'image/jpg', 'image/png'];

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
      final String mimeType = file.mimeType ?? '';

      if (!permitedMimeTypes.contains(mimeType)) {
        final string = 'Tipo de arquivo não permitido: $mimeType';
      }
      eventIdentfications
          .add(EventIdentification.fromJson(response.data['data']));
    }
  }

  Future<void> addEventImages(DropDoneDetails details) async {
    for (final file in details.files) {
      final String mimeType = file.mimeType ?? '';

      if (!permitedMimeTypes.contains(mimeType)) {
        final String errorMessage = 'Tipo de arquivo não permitido: $mimeType';
      }

      final size = await file.length() / (1024 * 1024);

      if (size > 20) {
        const String errorMessage =
            'Arquivo muito grande, tamanho máximo: 20MB';
      }

      evnentImages.add(EventImage(
        id: '1',
        name: 'name',
        size: size,
        price: 1,
        type: 'type',
        url: 'url',
        thumbnailUrl: 'thumbnailUrl',
      ));
    }
  }
}
