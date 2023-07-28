import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_separator/app/core/helpers/file/file_utils.dart';
import 'package:photo_separator/app/data/models/event_identification_model.dart';
import 'package:photo_separator/app/data/models/event_image_model.dart';
import 'package:photo_separator/app/data/models/event_model.dart';
import 'package:photo_separator/app/data/repositories/event_indentification_repository.dart';
import 'package:photo_separator/app/data/repositories/event_image_repository.dart';
import 'package:photo_separator/app/data/repositories/event_repository.dart';
import 'package:photo_separator/app/widgets/app_dialog.dart';

class EventDetailController extends GetxController {
  final EventRepository _eventRepository = EventRepository();
  final EventIndentificationRepository eventIndentificationRepository =
      EventIndentificationRepository();
  final EventImageRepository _eventImageRepository = EventImageRepository();

  final eventId = Get.parameters['eventId'] ?? '';

  final event = Event().obs;

  final dropZoneIdenficationIsHovered = false.obs;

  final dropZonePhotosIsHovered = false.obs;

  final RxList<EventIdentification> eventIdentfications =
      <EventIdentification>[].obs;
  final RxList<EventImage> eventImages = <EventImage>[].obs;

  final RxList<EventIdentification> tmpEventIdentfications =
      <EventIdentification>[].obs;
  final RxList<EventImage> tmpEventImages = <EventImage>[].obs;

  final RxBool tmpEventImagesIsLoading = false.obs;

  List permitedMimeTypes = ['image/jpeg', 'image/jpg', 'image/png'];

  @override
  void onInit() {
    super.onInit();
    getEvent();
    getEventIdentifications();
    getEventImages();
  }

  Future<void> getEvent() async {
    final response = await _eventRepository.getEventById(eventId);
    event.value = Event.fromJson(response.data['data']);
  }

  Future<void> getEventIdentifications() async {
    final response = await eventIndentificationRepository.getAll(eventId);
    eventIdentfications
        .assignAll(EventIdentification.fromJsonList(response.data['data']));
  }

  Future<void> getEventImages() async {
    final response = await _eventImageRepository.getAll(eventId);
    eventImages.assignAll(EventImage.fromJsonList(response.data['data']));
  }

  Future<void> addEventIdentification(List<XFile> files) async {
    for (final file in files) {
      // final size = await file.length();

      // if (size > 20000) {
      //   return;
      // }

      final bytes = await FileUtils.encodeFileToBase64(file);

      tmpEventIdentfications.add(EventIdentification.tmp(
        bytes: bytes,
        name: file.name,
      ));

      final response = await eventIndentificationRepository.add(
        tmpEventIdentfications.last,
        eventId,
      );

      eventIdentfications
          .add(EventIdentification.fromJson(response.data['data']));

      tmpEventIdentfications.removeLast();
    }
  }

  Future<void> addEventImagesTemporary(List<XFile> files) async {
    tmpEventImages.clear();
    tmpEventImagesIsLoading.value = true;

    for (final file in files) {
      String errorMessage = '';

      if (!permitedMimeTypes.contains(file.mimeType)) {
        errorMessage = 'Formato de arquivo não permitido: ${file.mimeType}';
      }

      final size = await file.length();

      tmpEventImages.add(EventImage.tmp(
        image: file,
        size: size,
        errorMessage: errorMessage,
      ));
    }

    tmpEventImagesIsLoading.value = false;

    Get.dialog(
      AppDialog(
        title: 'Imagens carregadas com sucesso!',
        primaryButtonLabel: 'Confirmar',
        onPrimaryButtonPressed: accepttmpEventImages,
        content: Obx(
          () => tmpEventImagesIsLoading.value
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
                              title: Text(tmpEventImages[index].image!.name),
                              subtitle: Text(
                                  'Tamanho: ${tmpEventImages[index].size}'),
                            );
                          },
                          itemCount: tmpEventImages.length,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Future<void> accepttmpEventImages() async {
    Get.back();

    // Use `Future.wait` to run the requests simultaneously.
    final responses = await Future.wait(
      tmpEventImages.map((image) async {
        // If the image has an error message, don't add it to the list of responses.
        // if (image.errorMessage != '') {
        //   return null;
        // }
        image.bytes = await FileUtils.encodeFileToBase64(image.image!);

        final response = await _eventImageRepository.add(image, eventId);

        eventImages.add(EventImage.fromJson(response.data['data']));

        tmpEventImages.remove(image);
      }),
    );

    tmpEventImages.clear();
  }

  Future<void> addEventImages() async {
    for (var element in tmpEventImages) {
      if (element.errorMessage != '') {
        return;
      }
    }
  }
}
