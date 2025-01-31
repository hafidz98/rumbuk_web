import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/room/controller/room_controller.dart';
import 'package:rumbuk_web/widgets/sidebars/custom_snackbar.dart';

import '../../constants/controllers.dart';
import '../../constants/style.dart';
import '../../widgets/custom_text.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);
  @override
  State<ReservationPage> createState() => _ReservationPageState();

  static const List<DataColumn> _columns = [
    DataColumn2(label: Text("No"), fixedWidth: 40),
    DataColumn2(label: Text("ID"), size: ColumnSize.S),
    DataColumn2(label: Text("Nama"), size: ColumnSize.L),
    DataColumn2(label: Text("Kapasitas"), size: ColumnSize.L),
    DataColumn2(label: Text("Aksi")),
  ];
}

class _ReservationPageState extends State<ReservationPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(RoomController());
  late bool _switchValue = true;

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
                    label: const Text("Booking Ruangan"),
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
                        columns: ReservationPage._columns,
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
                      const SizedBox(width: 5),
                      const Text('Aktif:'),
                      Transform.scale(
                        scale: 0.5,
                        child: Switch(
                          value: _switchValue,
                          activeColor: Colors.green,
                          onChanged: (value) {
                            setState(() {_switchValue = value;});
                          },
                        ),
                      )
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
