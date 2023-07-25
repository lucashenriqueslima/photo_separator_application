import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_separator/app/core/helpers/file/file_utils.dart';
import 'package:photo_separator/app/data/models/event_identification_model.dart';
import 'package:photo_separator/app/data/models/event_image_model.dart';
import 'package:photo_separator/app/data/models/event_model.dart';
import 'package:photo_separator/app/data/models/event_temporary_image.dart';
import 'package:photo_separator/app/data/repositories/event_identification_repository.dart';
import 'package:photo_separator/app/data/repositories/event_image_repository.dart';
import 'package:photo_separator/app/data/repositories/event_repository.dart';
import 'package:photo_separator/app/widgets/app_dialog.dart';

class EventDetailController extends GetxController {
  final EventRepository _eventRepository = EventRepository();
  final EventIdentificationRepository eventIdentificationRepository =
      EventIdentificationRepository();
  final EventImageRepository _eventImageRepository = EventImageRepository();

  final eventId = Get.parameters['eventId'] ?? '';

  final event = Event().obs;

  final dropZoneIdenficationIsHovered = false.obs;

  final dropZonePhotosIsHovered = false.obs;

  final RxList<EventIdentification> eventIdentfications =
      <EventIdentification>[].obs;

  final RxList<EventTemporaryImage> temporaryImages =
      <EventTemporaryImage>[].obs;
  final RxBool temporaryImagesIsLoading = false.obs;
  final RxList<EventImage> eventImages = <EventImage>[].obs;

  List permitedMimeTypes = ['image/jpeg', 'image/jpg', 'image/png'];

  @override
  void onInit() {
    super.onInit();
    getEvent();
  }

  Future<void> getEvent() async {
    final response = await _eventRepository.getEventById(eventId);
    event.value = Event.fromJson(response.data['data']);
  }

  Future<void> addEventIdentification(List<XFile> files) async {
    for (final file in files) {
      final size = await file.length();

      // if (size > 20000) {
      //   return;
      // }

      final bytes = await FileUtils.encodeFileToBase64(file);

      final response = await eventIdentificationRepository.add(
        bytes,
        file.name,
        eventId,
      );

      final eventIdentification =
          EventIdentification.fromJson(response.data['data']);
    }
  }

  Future<void> addEventImagesTemporary(List<XFile> files) async {
    temporaryImages.clear();
    temporaryImagesIsLoading.value = true;

    Get.dialog(
      AppDialog(
        title: 'Imagens carregadas com sucesso!',
        primaryButtonLabel: 'Confirmar',
        onPrimaryButtonPressed: acceptTemporaryImages,
        content: Obx(
          () => temporaryImagesIsLoading.value
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    const Text('Imagens carregadas com sucesso!'),
                    const Text('Valor: '),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[600]!,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      constraints: const BoxConstraints(
                          maxHeight: 400, minHeight: 300.0, maxWidth: 400),
                      child: Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.amber,
                                child: Text((index + 1).toString()),
                              ),
                              title: Text(temporaryImages[index].image!.name),
                              subtitle: Text(
                                  'Tamanho: ${temporaryImages[index].size}'),
                            );
                          },
                          itemCount: temporaryImages.length,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );

    for (final file in files) {
      String errorMessage = '';

      if (!permitedMimeTypes.contains(file.mimeType)) {
        errorMessage = 'Formato de arquivo não permitido: ${file.mimeType}';
      }

      final size = await file.length();

      // if (size > 20000) {
      //   errorMessage = 'Arquivo muito pesado, tamanho máximo: 20MB';
      // }

      temporaryImages.add(EventTemporaryImage(
        image: file,
        size: size,
        errorMessage: errorMessage,
      ));
    }

    temporaryImagesIsLoading.value = false;
  }

  Future<void> acceptTemporaryImages() async {
    Get.back();

    // Use `Future.wait` to run the requests simultaneously.
    final responses = await Future.wait(
      temporaryImages.map((image) async {
        // If the image has an error message, don't add it to the list of responses.
        // if (image.errorMessage != '') {
        //   return null;
        // }
        image.bytes = await FileUtils.encodeFileToBase64(image.image!);

        final response = await _eventImageRepository.add(image, eventId);

        final eventImage = EventImage.fromJson(response.data['data']);

        eventImages.add(eventImage);

        temporaryImages.remove(image);
      }),
    );

    temporaryImages.clear();

    // print(responses);
  }

  Future<void> addEventImages() async {
    for (var element in temporaryImages) {
      if (element.errorMessage != '') {
        return;
      }
    }
  }
}
