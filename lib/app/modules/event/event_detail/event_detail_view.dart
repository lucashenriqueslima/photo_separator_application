import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_separator/app/core/helpers/constants/constants.dart';
import 'package:photo_separator/app/themes/styles/app_colors.dart';
import 'package:photo_separator/app/widgets/app_button.dart';
import 'package:photo_separator/app/widgets/app_default_layout.dart';

import 'event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppDefaultLayout(
      title: 'Evento',
      subtitle: 'Evento',
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: Obx(
                () => DropTarget(
                  onDragEntered: (_) =>
                      controller.dropZoneIdenficationIsHovered.value = true,
                  onDragExited: (_) =>
                      controller.dropZoneIdenficationIsHovered.value = false,
                  onDragDone: (details) =>
                      controller.addEventIdentification(details.files),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: controller.dropZoneIdenficationIsHovered.value
                          ? Colors.blue.withOpacity(0.3)
                          : const Color(0xFFF8F1F1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: controller.dropZoneIdenficationIsHovered.value
                            ? Colors.blue
                            : Colors.grey[600]!,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          controller.dropZoneIdenficationIsHovered.value
                              ? Icons.cloud_upload
                              : Icons.cloud_upload_outlined,
                          size: 100,
                          color: controller.dropZoneIdenficationIsHovered.value
                              ? Colors.blue
                              : Colors.grey[600],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller.dropZoneIdenficationIsHovered.value
                              ? 'Solte as fotos de identificação aqui!'
                              : 'Arraste as fotos de identificação aqui',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                controller.dropZoneIdenficationIsHovered.value
                                    ? Colors.blue
                                    : Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              flex: 2,
              child: Obx(
                () => DropTarget(
                  onDragDone: (details) async =>
                      controller.addEventImagesTemporary(details.files),
                  onDragEntered: (_) =>
                      controller.dropZonePhotosIsHovered.value = true,
                  onDragExited: (_) =>
                      controller.dropZonePhotosIsHovered.value = false,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: controller.dropZonePhotosIsHovered.value
                          ? Colors.blue.withOpacity(0.3)
                          : const Color(0xFFF8F1F1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: controller.dropZonePhotosIsHovered.value
                            ? Colors.blue
                            : Colors.grey[600]!,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          controller.dropZonePhotosIsHovered.value
                              ? Icons.cloud_upload
                              : Icons.cloud_upload_outlined,
                          size: 100,
                          color: controller.dropZonePhotosIsHovered.value
                              ? Colors.blue
                              : Colors.grey[600],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          controller.dropZonePhotosIsHovered.value
                              ? 'Solte as fotos do evento aqui!'
                              : 'Arraste as fotos do evento aqui',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: controller.dropZonePhotosIsHovered.value
                                ? Colors.blue
                                : Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Obx(
                () => GridView.builder(
                  itemCount: controller.eventIdentfications.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5),
                  itemBuilder: (context, index) {
                    return Container(
                        width: 30,
                        height: 30,
                        color: context.primary,
                        child: Image.network(
                          "https://studiom-arquivos-formandos-publicos.s3.amazonaws.com/${controller.eventIdentfications[index].name!}",
                          fit: BoxFit.cover,
                        )).paddingAll(5);
                  },
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Obx(() => Visibility(
                        visible: controller.tmpEventImages.isNotEmpty,
                        child: Text(
                            "Faltam ${controller.tmpEventImages.length.toString()} imagens."),
                      )),
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
                      () => controller.eventImages.isEmpty
                          ? const Center(
                              child: Text('Nenhuma imagem carregada'),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    child: Text((index + 1).toString()),
                                  ),
                                  title: Text(controller
                                      .eventImages[index].name!
                                      .split('/')
                                      .last),
                                  subtitle: Text(
                                      'Tamanho: ${controller.eventImages[index].size}'),
                                );
                              },
                              itemCount: controller.eventImages.length,
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AppButton(
                      label: 'Fazer Separação',
                      onPressed: () => controller.compareFaces())
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
