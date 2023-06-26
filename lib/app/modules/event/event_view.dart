import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_separator/app/core/extensions/size_extensions.dart';
import 'package:photo_separator/app/modules/event/create_event/create_event_view.dart';

import 'event_controller.dart';

class EventView extends GetView<EventController> {
  const EventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 100.0.wp,
            padding: const EdgeInsets.all(16.0),
            child: CupertinoSlidingSegmentedControl(
              onValueChanged: (dynamic index) => controller.changeIndex(index!),
              children: _getPages()
            ),
          )
        ],
      )
    );
  }
}

Map<dynamic, Widget> _getPages () {
  return {
    0: const CreateEventView(),
    1: const Center(child: Text('Event'),),
  };
}
