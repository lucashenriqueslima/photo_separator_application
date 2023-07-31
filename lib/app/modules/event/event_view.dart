import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_separator/app/routes/app_pages.dart';
import 'package:photo_separator/app/widgets/app_default_layout.dart';

import 'event_controller.dart';

class EventView extends GetView<EventController> {
  const EventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppDefaultLayout(
      title: 'Início',
      subtitle: 'Início',
      useSingleChildScrollView: false,
      children: [
        Expanded(
          child: Obx(
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
                        '${Routes.EVENT}/${controller.events[index].id}');
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
          ),
        ),
      ],
    );
  }
}
