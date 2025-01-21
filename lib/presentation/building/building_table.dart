import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/presentation/building/controller/building_controller.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

import '../../domain/model/building.dart';
import 'widgets/formfield.dart';

class BuildingTable extends StatefulWidget {
  const BuildingTable({super.key});

  @override
  State<BuildingTable> createState() => _BuildingTableState();
}

class _BuildingTableState extends State<BuildingTable> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final controller = Get.put(BuildingController());
  var data = [].obs;

  static const List<DataColumn> _columns = [
    DataColumn2(label: Text("No"), size: ColumnSize.S, fixedWidth: 38),
    DataColumn2(label: Text("ID"), size: ColumnSize.S),
    DataColumn2(label: Text("Name"), size: ColumnSize.L),
    DataColumn2(label: Text("Aksi"), size: ColumnSize.S,fixedWidth: 38),
  ];

  List<DataRow> dataTable() {
    return List<DataRow>.generate(
      data.length,
          (index) => DataRow(
        cells: [
          DataCell(CustomText(text: (index + 1).toString() )),
          DataCell(CustomText(text: data[index].id)),
          DataCell(CustomText(text: data[index].name)),
          DataCell(
            IconButton(
              tooltip: 'Edit',
                icon: const Icon(Icons.edit_outlined),
                padding: EdgeInsets.zero,
                iconSize: 18,
                splashRadius: 18,
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                  //_scaffoldKey.currentState!.openEndDrawer();
                }),
            //ElevatedButton(onPressed: (){}, child: Text("Edit"))
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const Drawer(
        elevation: 16,
        child: FormFieldTable(),
      ),
      body: Obx(() => Container(
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
                columns: _columns,
                rows: dataTable()
              ),
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    _getData();
    //log("data ${controller.buildingList.length}");
  }

  Future _getData() async {
    // controller.fetchBuildingData();
    // return data = controller.buildingList;
  }
}

/*
 TODO: building page add New Button
 TODO: rework table UI
 Todo: rework page UI
 Todo: Form new data to API Service
 Todo: Edit form from table action button
 Todo: Table progress indicator
 */