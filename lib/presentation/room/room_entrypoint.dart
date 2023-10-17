import 'dart:developer';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/domain/model/room.dart';
import 'package:rumbuk_web/presentation/room/controller/room_controller.dart';
import 'package:rumbuk_web/presentation/room/widgets/room_edit_form.dart';

import '../../constants/controllers.dart';
import '../../constants/style.dart';
import '../../helpers/responsiveness.dart';
import '../../widgets/custom_text.dart';
import '../building/widgets/formfield.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({Key? key}) : super(key: key);
  @override
  State<RoomPage> createState() => _RoomPageState();

  static const List<DataColumn> _columns = [
    DataColumn2(label: Text("No"), size: ColumnSize.S, fixedWidth: 38),
    DataColumn2(label: Text("ID"), size: ColumnSize.S),
    DataColumn2(label: Text("Nama"), size: ColumnSize.L),
    DataColumn2(label: Text("Kapasitas"), size: ColumnSize.L),
    DataColumn2(label: Text("Aksi"), size: ColumnSize.S,fixedWidth: 38),
  ];
}

class _RoomPageState extends State<RoomPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = Get.put(RoomController());

  //var _data = [].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        elevation: 16,
        child: _controller.getDrawer(),
      ),
      body: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: CustomText(
                      text: menuController.activeItem.value,
                      size: 24,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() => _controller.drawerIndex.value = 0);
                    _scaffoldKey.currentState!.openEndDrawer();
                  },
                  label: const Text("New Data"),
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
          Expanded(child: Obx(() => Container(
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
                  columns: RoomPage._columns,
                  rows: _dataTable()
              ),
            ),
          )))
        ],
      ),
    );
  }

  List<DataRow> _dataTable() {
    return List<DataRow>.generate(_controller.roomList.length, (index) => DataRow(
      cells: [
        DataCell(CustomText(text: (index + 1).toString() )),
        DataCell(CustomText(text: _controller.roomList[index].id.toString())),
        DataCell(CustomText(text: _controller.roomList[index].name)),

        DataCell(CustomText(text: _controller.roomList[index].capacity.toString())),
        DataCell(
          IconButton(
              icon: const Icon(Icons.edit_outlined),
              padding: EdgeInsets.zero,
              iconSize: 18,
              splashRadius: 18,
              onPressed: () {
                //Scaffold.of(context).openEndDrawer();

                setState(() {
                  _controller.roomData = _controller.roomList[index];
                  log("[Rom:Room][roomData]: $_controller.roomList[index]");
                  _controller.drawerIndex.value = 1;
                });
                if (_controller.drawerIndex.value == 1) {_scaffoldKey.currentState!.openEndDrawer();}
              }),
          //ElevatedButton(onPressed: (){}, child: Text("Edit"))
        ),
      ],
    ));
  }

  // Future _getRoomData() async {
  //   return _data = await _controller.getRoomListData();
  // }

  @override
  void initState() {
    //_getRoomData();
    //_data = _controller.roomList;
    log("[Page:Room][_data]: $_controller.roomList");
    super.initState();
  }
}
