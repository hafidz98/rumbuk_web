import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/room/controller/room_controller.dart';
import 'package:rumbuk_web/widgets/sidebars/custom_snackbar.dart';

import '../../constants/controllers.dart';
import '../../constants/style.dart';
import '../../widgets/custom_text.dart';

class RoomTimePage extends StatefulWidget {
  const RoomTimePage({Key? key}) : super(key: key);
  @override
  State<RoomTimePage> createState() => _RoomTimePageState();

  static const List<DataColumn> _columns = [
    DataColumn2(label: Text("No"), fixedWidth: 40),
    DataColumn2(label: Text("ID"), size: ColumnSize.S),
    DataColumn2(label: Text("Nama"), size: ColumnSize.L),
    DataColumn2(label: Text("Kapasitas"), size: ColumnSize.L),
    DataColumn2(label: Text("Aksi")),
  ];
}

class _RoomTimePageState extends State<RoomTimePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(RoomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: _controller.getDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 18,
                      weight: FontWeight.bold,
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: () {
                      setState(() => _controller.drawerIndex.value = 0);
                      if (_controller.drawerIndex.value == 0) {
                        _scaffoldKey.currentState!.openEndDrawer();
                      }
                    },
                    label: const Text("Ruangan Baru"),
                    icon: const Icon(
                      Icons.add,
                      size: 24,
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60.0, 40.0),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(
                () => Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: lightGrey, width: .5),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     offset: Offset(0, 2),
                    //     color: Colors.grey, //lightGrey.withOpacity(.1),
                    //     spreadRadius: 0.1,
                    //     blurRadius: 4,
                    //   )
                    // ],
                    borderRadius: const BorderRadius.all(Radius.circular(2)),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: (56 * 7) + 40,
                    child: DataTable2(
                        fixedTopRows: 1,
                        columnSpacing: 6,
                        dataRowHeight: 48,
                        headingRowHeight: 40,
                        horizontalMargin: 12,
                        minWidth: 600,
                        columns: RoomTimePage._columns,
                        rows: _dataTable()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataRow> _dataTable() {
    return List<DataRow>.generate(
        _controller.roomList.length,
        (index) => DataRow(
              //color: MaterialStateColor.resolveWith((states) => index % 2 == 0 ? Colors.red : Colors.black),
              cells: [
                DataCell(CustomText(text: (index + 1).toString())),
                DataCell(CustomText(
                    text: _controller.roomList[index].id.toString())),
                DataCell(CustomText(text: _controller.roomList[index].name)),
                DataCell(CustomText(
                    text: _controller.roomList[index].capacity.toString())),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                          tooltip: 'Edit',
                          icon: const Icon(Icons.edit_outlined),
                          padding: EdgeInsets.zero,
                          iconSize: 18,
                          splashRadius: 18,
                          onPressed: () {
                            setState(() {
                              _controller.roomData = _controller.roomList[index];
                              log("[Rom:Room][roomData]: $_controller.roomList[index]");
                              _controller.drawerIndex.value = 1;
                            });
                            if (_controller.drawerIndex.value == 1) {
                              _scaffoldKey.currentState!.openEndDrawer();
                            }
                          }),
                      IconButton(
                          tooltip: 'Delete',
                          icon: const Icon(Icons.delete_forever),
                          padding: EdgeInsets.zero,
                          iconSize: 18,
                          splashRadius: 18,
                          onPressed: () {

                            setState(() {
                              // _controller.roomData = _controller.roomList[index];
                              // log("[Rom:Room][roomData]: $_controller.roomList[index]");
                              // _controller.drawerIndex.value = 1;
                              CustomSnackBar.of(context).customSnackBar('Akan di implementasi');
                            });
                            // if (_controller.drawerIndex.value == 1) {
                            //   _scaffoldKey.currentState!.openEndDrawer();
                            // }
                          }),
                    ],
                  ),
                  //ElevatedButton(onPressed: (){}, child: Text("Edit"))
                ),
              ],
            ));
  }

  @override
  void initState() {
    log("[Page:Room][_data]: $_controller.roomList");
    super.initState();
  }
}
