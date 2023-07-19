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

  final RxList<EventImage> temporaryEventImages = <EventImage>[].obs;
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
    // for (final file in details.files) {
    //   final String mimeType = file.mimeType ?? '';

    //   if (!permitedMimeTypes.contains(mimeType)) {
    //     final string = 'Tipo de arquivo não permitido: $mimeType';
    //   }
    //   eventIdentfications
    //       .add(EventIdentification.fromJson(response.data['data']));
    // }
  }

  Future<void> addTemporaryEventImages(DropDoneDetails details) async {
    for (final file in details.files) {
      String errorMessage = '';

      if (!permitedMimeTypes.contains(file.mimeType)) {
        errorMessage = 'Formato de arquivo não permitido: ${file.mimeType}';
      }

      final sizeInMb = await file.length() / (1024 * 1024);

      if (sizeInMb > 20) {
        errorMessage = 'Arquivo muito pesado, tamanho máximo: 20MB';
      }

      temporaryEventImages.add(EventImage(
        image: file,
        errorMessage: errorMessage,
      ));
    }
  }

  Future<void> addEventImages() async {
    for (var element in temporaryEventImages) {
      if (element.errorMessage != '') {
        return;
      }
    }
  }
}
