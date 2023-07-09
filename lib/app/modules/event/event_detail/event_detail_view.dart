import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EventDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
