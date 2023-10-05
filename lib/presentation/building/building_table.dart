import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/presentation/building/building_controller.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

import '../../domain/model/building.dart';

class BuildingTable extends StatefulWidget {
  const BuildingTable({super.key});

  @override
  State<BuildingTable> createState() => _BuildingTableState();
}

class _BuildingTableState extends State<BuildingTable> {
  final BuildingController controller = Get.put(BuildingController());
  List data = [].obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: (56 * 7) + 40,
            child: DataTable2(
              columnSpacing: 12,
              dataRowHeight: 56,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn2(
                  label: Text("No."),
                ),
                DataColumn2(
                  label: Text("ID"),
                ),
                DataColumn(
                  label: Text('Name'),
                ),
              ],
              rows: List.generate(
                data.length,
                (index) => DataRow(
                  cells: [
                    DataCell(CustomText(text: (index + 1).toString() )),
                    DataCell(CustomText(text: data[index].id)),
                    DataCell(CustomText(text: data[index].name)),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    _getData();
    log("data ${controller.buildingList.length}");
  }

  Future _getData() async {
    controller.fetchBuildingData();
    return data = controller.buildingList;
  }
}
