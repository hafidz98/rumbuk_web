import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/room/controller/room_controller.dart';

import '../../constants/controllers.dart';
import '../../constants/style.dart';
import '../../widgets/custom_text.dart';

class StaffPage extends StatefulWidget {
  const StaffPage({Key? key}) : super(key: key);
  @override
  State<StaffPage> createState() => _StaffPageState();

  static const List<DataColumn> _columns = [
    DataColumn2(label: Text("No"), fixedWidth: 40),
    DataColumn2(label: Text("ID"), size: ColumnSize.S),
    DataColumn2(label: Text("Mulai"), size: ColumnSize.L),
    DataColumn2(label: Text("Selesai"), size: ColumnSize.L),
    DataColumn2(label: Text("Durasi"), size: ColumnSize.S),
    DataColumn2(label: Text("Aksi")),
  ];
}

class _StaffPageState extends State<StaffPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(RoomController());
  //late bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: _controller.getDrawer(),
      ),
      body: Column(
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
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() => _controller.drawerIndex.value = 0);
                    if (_controller.drawerIndex.value == 0) {
                      _scaffoldKey.currentState!.openEndDrawer();
                    }
                  },
                  label: const Text("Jam Baru"),
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
                margin: const EdgeInsets.only(bottom: 30),
                child: SizedBox(
                  height: (56 * 7) + 40,
                  child: DataTable2(
                      fixedTopRows: 1,
                      columnSpacing: 6,
                      dataRowHeight: 48,
                      headingRowHeight: 40,
                      horizontalMargin: 12,
                      minWidth: 600,
                      columns: StaffPage._columns,
                      rows: _dataTable()),
                ),
              ),
            ),
          ),
        ],
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
                              _controller.roomData =
                                  _controller.roomList[index];
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
                            SnackBar snackBar = SnackBar(
                              content: const Text('To be Implemented'),
                              behavior: SnackBarBehavior.floating,
                              showCloseIcon: true,
                              duration: const Duration(seconds: 2),
                              //width: 320,
                              margin: EdgeInsets.only(
                                  bottom: 10,
                                  right: 10,
                                  left:
                                      MediaQuery.of(context).size.width * 0.7),
                            );
                            setState(() {
                              // _controller.roomData = _controller.roomList[index];
                              // log("[Rom:Room][roomData]: $_controller.roomList[index]");
                              // _controller.drawerIndex.value = 1;
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            });
                            // if (_controller.drawerIndex.value == 1) {
                            //   _scaffoldKey.currentState!.openEndDrawer();
                            // }
                          }),
                      // const SizedBox(width: 5),
                      // const Text('Aktif:'),
                      // Transform.scale(
                      //   scale: 0.5,
                      //   child: Switch(
                      //     value: _switchValue,
                      //     activeColor: Colors.green,
                      //     onChanged: (value) {
                      //       setState(() {_switchValue = value;});
                      //     },
                      //   ),
                      // )
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
