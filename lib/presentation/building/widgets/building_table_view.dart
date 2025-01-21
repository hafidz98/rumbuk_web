import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/building/controller/building_controller.dart';

class UIBuildingTable extends GetView<BuildingController> {
  const UIBuildingTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buildings')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return DataTable2(
            columns: const [
              DataColumn2(label: Text('ID'), size: ColumnSize.S),
              DataColumn2(label: Text('Name'), size: ColumnSize.M),
              DataColumn2(label: Text('Created At'), size: ColumnSize.L),
              DataColumn2(label: Text('Updated At'), size: ColumnSize.L),
            ],
            rows: controller.buildings.map((building) => DataRow2(
              cells: [
                DataCell(Text(building.id.toString())),
                DataCell(Text(building.name)),
                DataCell(Text(building.createdAt.toString())),
                DataCell(Text(building.updatedAt.toString())),
              ],
            )).toList(),
          );
        }
      }),
    );
  }
}