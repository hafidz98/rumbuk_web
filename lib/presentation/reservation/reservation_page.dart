import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/reservation/controller/reservation_controller.dart';
import 'package:rumbuk_web/widgets/sidebars/custom_snackbar.dart';

import 'package:rumbuk_web/constants/controllers.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

class ReservationPage extends StatefulWidget {
  const ReservationPage({Key? key}) : super(key: key);
  @override
  State<ReservationPage> createState() => _ReservationPageState();

  static const List<DataColumn2> _columns = [
    DataColumn2(label: Text("No"), fixedWidth: 40),
    DataColumn2(label: Text("ID Reservasi"), size: ColumnSize.S),
    DataColumn2(label: Text("NPM"), fixedWidth: 80),
    DataColumn2(
      label: Text("Nama Mahasiswa"),
      size: ColumnSize.L,
    ),
    DataColumn2(label: Text("Tanggal"), size: ColumnSize.M),
    DataColumn2(label: Text("Ruangan"), size: ColumnSize.L),
    DataColumn2(label: Text("Aktivitas"), size: ColumnSize.L),
    DataColumn2(label: Text("Jam Mulai"), size: ColumnSize.S),
    DataColumn2(label: Text("Jam Selesai"), size: ColumnSize.S),
    DataColumn2(label: Text("Status"), size: ColumnSize.S),
    DataColumn2(
      label: Text("Aksi"),
      headingRowAlignment: MainAxisAlignment.center,
      size: ColumnSize.S,
    ),
  ];
}

class _ReservationPageState extends State<ReservationPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(ReservationController());
  //late bool _switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        shape: const LinearBorder(),
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
                    icon: const Icon(Icons.add, size: 24),
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
                      fixedLeftColumns: 1,
                      empty: const Center(child: Text('No data')),
                      columnSpacing: 6,
                      dataRowHeight: 50,
                      headingRowHeight: 40,
                      horizontalMargin: 12,
                      minWidth: 1500,
                      columns: ReservationPage._columns,
                      rows: _dataTable(),
                    ),
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
      _controller.reservationList.length,
      (index) => DataRow(
        //color: MaterialStateColor.resolveWith((states) => index % 2 == 0 ? Colors.red : Colors.black),
        cells: [
          DataCell(CustomText(text: (index + 1).toString())),
          DataCell(CustomText(
            text: _controller.reservationList[index].reservationId.toString(),
          )),
          DataCell(CustomText(
            text: _controller.reservationList[index].studentId!,
          )),
          DataCell(CustomText(
              text: _controller.reservationList[index].studentName!)),
          DataCell(CustomText(
            text: _controller.formatDate
                .format(_controller.reservationList[index].bookingDate!),
          )),
          DataCell(
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: _controller.reservationList[index].room!,
                ),
                CustomText(
                  size: 12,
                  text: "Lantai: ${_controller.reservationList[index].floor!}, "
                      "Gedung: ${_controller.reservationList[index].building!}",
                )
              ],
            ),
          ),
          DataCell(CustomText(
            text: _controller.reservationList[index].activity!,
          )),
          DataCell(CustomText(
            text: _controller.reservationList[index].startTime!,
          )),
          DataCell(CustomText(
            text: _controller.reservationList[index].endTime!,
          )),
          DataCell(
            Chip(
              visualDensity: VisualDensity.compact,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              color: WidgetStatePropertyAll(
                ReservationStatus.fromCode(
                        _controller.reservationList[index].status!)!
                    .color
                    .withValues(alpha: 0.2),
              ),
              side: BorderSide(
                  color: ReservationStatus.fromCode(
                          _controller.reservationList[index].status!)!
                      .color),
              label: CustomText(
                size: 12,
                text: ReservationStatus.fromCode(
                        _controller.reservationList[index].status!)!
                    .description,
                color: ReservationStatus.fromCode(
                        _controller.reservationList[index].status!)!
                    .color,
              ),
            ),
          ),
          DataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    tooltip: 'Edit',
                    icon: const Icon(Icons.edit_outlined),
                    padding: EdgeInsets.zero,
                    iconSize: 18,
                    splashRadius: 18,
                    onPressed: () {
                      // setState(() {
                      //   _controller.reservationData =
                      //       _controller.reservationList[index];
                      //   //log("[Rom:Res][reservationList]: $_controller.reservationList[index]");
                      //   _controller.drawerIndex.value = 1;
                      // });
                      CustomSnackBar.of(context)
                          .customSnackBar('Akan di implementasi');
                      // if (_controller.drawerIndex.value == 1) {
                      //   _scaffoldKey.currentState!.openEndDrawer();
                      // }
                    }),
                IconButton(
                    tooltip: 'Delete',
                    icon: const Icon(Icons.delete_forever),
                    padding: EdgeInsets.zero,
                    iconSize: 18,
                    splashRadius: 18,
                    onPressed: () {
                      CustomSnackBar.of(context)
                          .customSnackBar('Akan di implementasi');
                      // setState(() {
                      //   // _controller.roomData = _controller.roomList[index];
                      //   // log("[Rom:Room][roomData]: $_controller.roomList[index]");
                      //   // _controller.drawerIndex.value = 1;
                      //   CustomSnackBar.of(context)
                      //       .customSnackBar('Akan di implementasi');
                      // });
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
                //       setState(() {
                //         _switchValue = value;
                //       });
                //     },
                //   ),
                // )
              ],
            ),
            //ElevatedButton(onPressed: (){}, child: Text("Edit"))
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    //log("[Page:Res][_data]: $_controller.reservationList");
    _controller.getReservationListData();
    super.initState();
  }
}
