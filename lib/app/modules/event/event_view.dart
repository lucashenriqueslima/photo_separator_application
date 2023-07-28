import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/modules/event/event_create/event_create_view.dart';
import 'package:photo_separator/app/modules/event/event_list/event_list_view.dart';
import 'package:photo_separator/app/themes/styles/app_colors.dart';
import 'package:photo_separator/app/themes/styles/app_text_styles.dart';

import 'event_controller.dart';

class EventView extends GetView<EventController> {
  const EventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'msc',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.square(30.0),
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(0),
                    alignment:
                        Alignment.centerLeft, // Alinha a TabBar à esquerda
                    child: TabBar(
                      indicatorColor: context.primary,
                      isScrollable: true,
                      tabs: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.list,
                              color: Color(0xFFA8ABAD),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Lista',
                              style: context.appTextStyles.textMedium.copyWith(
                                  color: context.disabled, fontSize: 16),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add,
                              color: Color(0xFFA8ABAD),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Criar',
                              style: context.appTextStyles.textMedium.copyWith(
                                  color: context.disabled, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              EventListView(),
              EventCreateView(),
            ],
          ),
        ),
      ),
    );
  }
}
