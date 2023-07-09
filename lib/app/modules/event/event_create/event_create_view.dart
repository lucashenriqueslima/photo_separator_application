import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'event_create_controller.dart';

class EventCreateView extends GetView<EventCreateController> {
  const EventCreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EventCreateView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EventCreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
