import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/constants/controllers.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/presentation/floor/controller/floor_controller.dart';
import 'package:rumbuk_web/widgets/custom_dialog.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';
import 'package:rumbuk_web/widgets/sidebars/custom_snackbar.dart';

class FloorPage extends StatefulWidget {
  const FloorPage({Key? key}) : super(key: key);
  @override
  State<FloorPage> createState() => _FloorPageState();

  static const List<DataColumn> _columns = [
    DataColumn2(label: Text("No"), fixedWidth: 40),
    DataColumn2(label: Text("ID Lantai"), size: ColumnSize.S),
    DataColumn2(label: Text("Nama"), size: ColumnSize.L),
    DataColumn2(label: Text("Gedung"), size: ColumnSize.L),
    DataColumn2(label: Text("Aksi")),
  ];
}

class _FloorPageState extends State<FloorPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controller = Get.put(FloorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        shape: const LinearBorder(),
        child: _controller.getDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 8),
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
                    label: const Text("Lantai Baru"),
                    icon: const Icon(Icons.add, size: 24),
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
                    border: Border.all(
                        color: dark.withValues(alpha: 0.2), width: .5),
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
                        columns: FloorPage._columns,
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
      _controller.floorList.length,
      (index) => DataRow(
        cells: [
          DataCell(CustomText(text: (index + 1).toString())),
          DataCell(
            CustomText(text: _controller.floorList[index].id.toString()),
          ),
          DataCell(
            CustomText(text: _controller.floorList[index].name.toString()),
          ),
          DataCell(
            CustomText(text: _controller.floorList[index].buildingName.toString()),
          ),
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
                      CustomSnackBar.of(context).customSnackBar('Akan di implementasi');
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
                    showDialog(
                      context: context,
                      builder: (context) => CustomDialog(
                          confirmButton: () {
                            Navigator.pop(context);
                            CustomSnackBar.of(context).customSnackBar('Akan di implementasi');
                          },
                          title: 'Peringatan',
                          description: 'Hapus item ini?'),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    //log("[Page:Room][_data]: $_controller.roomList");
    super.initState();
  }
}
