import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_separator/app/widgets/app_default_layout.dart';

import 'event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const AppDefaultLayout(
      title: 'Evento',
      subtitle: 'Evento',
      children: [
        Text('EventDetailView'),
      ],
    );
  }
}
