import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_separator/app/routes/app_pages.dart';

import 'event_list_controller.dart';

class EventListView extends GetView<EventListController> {
  const EventListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DataTable2(
        columnSpacing: 15,
        horizontalMargin: 12,
        minWidth: 500,
        columns: const [
          DataColumn2(
            label: Text('Cód.'),
            size: ColumnSize.S,
          ),
          DataColumn2(
            label: Text('Título de Evento'),
            size: ColumnSize.L,
          ),
          DataColumn2(
            label: Text('Data de Realização'),
            size: ColumnSize.S,
          ),
          DataColumn2(
            label: Text('Status'),
            size: ColumnSize.S,
          ),
        ],
        rows: List<DataRow>.generate(
          controller.events.length,
          (index) => DataRow2(
            onTap: () {
              Get.toNamed(
                  '${Routes.EVENT_DETAIL}/${controller.events[index].id}');
            },
            cells: [
              DataCell(Text(controller.events[index].id.toString())),
              DataCell(Text(controller.events[index].title ?? '')),
              DataCell(Text(controller.events[index].status ?? '')),
              DataCell(Text(controller.events[index].status ?? '')),
            ],
          ),
        ),
      ),
    );
  }
}
