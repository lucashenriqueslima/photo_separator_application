import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
          children: [
            Expanded(
              flex: 5,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: const Color(0xFFCFCCCC),
                  child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.cloud_upload,
                          size: 100,
                        ),
                        Text('Fotos de Indentificação aqui'),
                      ]),
                ),
              ),
            ),
            Expanded(flex: 3, child: Container())
          ],
        ),
      ],
    );
  }
}
