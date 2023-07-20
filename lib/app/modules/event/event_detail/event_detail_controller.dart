
import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/data/models/event_identification_model.dart';
import 'package:photo_separator/app/data/models/event_image_model.dart';
import 'package:photo_separator/app/data/models/event_model.dart';
import 'package:photo_separator/app/data/repositories/event_repository.dart';
import 'package:photo_separator/app/widgets/app_dialog.dart';

class EventDetailController extends GetxController {
  final EventRepository _repository = EventRepository();

  final id = Get.parameters['id'];

  final event = Event().obs;

  final dropZoneIdenficationIsHovered = false.obs;

  final dropZonePhotosIsHovered = false.obs;

  final RxList<EventIdentification> eventIdentfications =
      <EventIdentification>[].obs;

  final RxList<EventImage> temporaryEventImages = <EventImage>[].obs;
  final RxBool temporaryEventImagesIsLoading = false.obs;
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
    temporaryEventImages.clear();
    temporaryEventImagesIsLoading.value = true;

    Get.dialog(
      AppDialog(
        title: 'Carregando imagens',
        content: Obx(
          () => temporaryEventImagesIsLoading.value
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
                          maxHeight: 500, minHeight: 56.0, maxWidth: 500),
                      child: Obx(() => ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                leading: Image.file()
                                title: Text(temporaryEventImages[index]
                                    .image!
                                    .name
                                    .toString()),
                                subtitle: const Text('80m'),
                              );
                            },
                            itemCount: temporaryEventImages.length,
                          )),
                    ),
                  ],
                ),
        ),
      ),
    );

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

    temporaryEventImagesIsLoading.value = false;
  }

  Future<void> addEventImages() async {
    for (var element in temporaryEventImages) {
      if (element.errorMessage != '') {
        return;
      }
    }
  }
}
