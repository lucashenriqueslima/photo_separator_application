import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:photo_separator/app/widgets/app_default_layout.dart';

import 'dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppDefaultLayout(title: 'Eventos', subtitle: 'Eventos', children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              DropdownButton(
                  hint: const Text("Filter by"),
                  items: const [
                    DropdownMenuItem(
                      value: "Date",
                      child: Text("Date"),
                    ),
                    DropdownMenuItem(
                      value: "Comments",
                      child: Text("Comments"),
                    ),
                    DropdownMenuItem(
                      value: "Views",
                      child: Text("Views"),
                    ),
                  ],
                  onChanged: (value) {}),
              const SizedBox(
                width: 20.0,
              ),
              DropdownButton(
                  hint: const Text("Order by"),
                  items: const [
                    DropdownMenuItem(
                      value: "Date",
                      child: Text("Date"),
                    ),
                    DropdownMenuItem(
                      value: "Comments",
                      child: Text("Comments"),
                    ),
                    DropdownMenuItem(
                      value: "Views",
                      child: Text("Views"),
                    ),
                  ],
                  onChanged: (value) {}),
            ],
          ),
        ],
      ),
      const SizedBox(
        height: 40.0,
      ),
      //Now let's add the Table
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DataTable(clipBehavior: Clip.hardEdge, columns: const [
            DataColumn(label: Text("Cód.")),
            DataColumn(label: Text("Título")),
            DataColumn(label: Text("Data de Realização")),
            DataColumn(label: Text("Status")),
            DataColumn(label: Text("Ação")),
          ], rows: [
            DataRow(cells: [
              const DataCell(Text("0")),
              const DataCell(Text("How to build a Flutter Web App")),
              DataCell(Text("${DateTime.now()}")),
              const DataCell(Text("2.3K Views")),
              const DataCell(Text("102Comments")),
            ]),
            DataRow(cells: [
              const DataCell(Text("1")),
              const DataCell(Text("How to build a Flutter Mobile App")),
              DataCell(Text("${DateTime.now()}")),
              const DataCell(Text("21.3K Views")),
              const DataCell(Text("1020Comments")),
            ]),
            DataRow(cells: [
              const DataCell(Text("2")),
              const DataCell(Text("Flutter for your first project")),
              DataCell(Text("${DateTime.now()}")),
              const DataCell(Text("2.3M Views")),
              const DataCell(Text("10K Comments")),
            ]),
          ]),
          //Now let's set the pagination
          const SizedBox(
            height: 40.0,
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "1",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "2",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "3",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "See All",
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ),
            ],
          )
        ],
      )
    ]);
  }
}
