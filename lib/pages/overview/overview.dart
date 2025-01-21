import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/constants/color.dart';
import 'package:rumbuk_web/constants/controllers.dart';
import 'package:rumbuk_web/helpers/responsiveness.dart';
import 'package:rumbuk_web/pages/overview/widgets/overview_card_medium.dart';
import 'package:rumbuk_web/pages/overview/widgets/overview_card_small.dart';
import 'package:rumbuk_web/pages/overview/widgets/revenue_section_small.dart';
import 'package:rumbuk_web/presentation/building/widgets/formfield.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

import '../../constants/style.dart';
import 'widgets/available_drivers.dart';
import 'widgets/overview_card_large.dart';
import 'widgets/revenue_section_large.dart';

class OverViewPage extends StatelessWidget {
  OverViewPage({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _row = List<DataRow>.generate(
    20,
    (index) => DataRow(
      cells: [
        DataCell(CustomText(text: (index + 1).toString())),
        DataCell(CustomText(text: "Ruang ${(index + 1).toString()}")),
        const DataCell(CustomText(text: "Lorem ipsum sit dolor amet")),
        const DataCell(CustomText(text: "30")),
        const DataCell(CustomText(text: "Room")),
        DataCell(
          IconButton(
              icon: const Icon(Icons.edit_outlined),
              padding: EdgeInsets.zero,
              iconSize: 18,
              splashRadius: 18,
              onPressed: () {}),
          //ElevatedButton(onPressed: (){}, child: Text("Edit"))
        ),
      ],
    ),
  );

  static const List<DataColumn> _columns = [
    DataColumn2(label: Text("ID"), size: ColumnSize.S),
    DataColumn2(label: Text("Name")),
    DataColumn2(label: Text("Desc")),
    DataColumn2(label: Text("Qty")),
    DataColumn2(label: Text("Type")),
    DataColumn2(label: Text(""), size: ColumnSize.S),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const Drawer(
        elevation: 16,
        child: FormFieldTable(),
      ),
      body: Column(
        children: [
          Obx(
            () => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Text('Selamat datang')),
            ],
          )),
          // Expanded(
          //   child: ListView(
          //     children: const [
          //       Text('Selamat datang')
          //       // if (ResponsiveWidget.isLargeScreen(context) ||
          //       //     ResponsiveWidget.isMediumScreen(context))
          //       //   if (ResponsiveWidget.isCustomScreen(context))
          //       //     const OverviewCardMediumScreen()
          //       //   else
          //       //     const OverviewCardLargeScreen()
          //       // else
          //       //   const OverviewCardSmallScreen(),
          //       // if (!ResponsiveWidget.isSmallScreen(context))
          //       //   const RevenueSectionLarge()
          //       // else
          //       //   const RevenueSectionSmall(),
          //       //AvailableDrivers()
          //
          //       // Row(
          //       //   children: [
          //       //     Expanded(
          //       //       child: CustomText(
          //       //         text: "Table Label",
          //       //         color: active.withOpacity(.7),
          //       //         weight: FontWeight.bold,
          //       //       ),
          //       //     ),
          //       //     ElevatedButton.icon(
          //       //       onPressed: () {
          //       //         _scaffoldKey.currentState!.openEndDrawer();
          //       //       },
          //       //       label: const Text("New Data"),
          //       //       icon: const Icon(
          //       //         Icons.add,
          //       //         size: 24,
          //       //       ),
          //       //       style: ElevatedButton.styleFrom(
          //       //         minimumSize: const Size(60.0, 40.0),
          //       //       ),
          //       //     )
          //       //   ],
          //       // ),
          //       // const SizedBox(
          //       //   height: 18,
          //       // ),
          //       // AvailableDriversTable(
          //       //   dataColumn: _columns,
          //       //   dataRow: _row,
          //       // )
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }

  // Container(
  // decoration: BoxDecoration(
  // color: primary.shade50.withOpacity(.4),
  // border: Border.all(color: primary, width: .5),
  // borderRadius: BorderRadius.circular(14),
  // ),
  // padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
  // child: const Text("07:00", style: TextStyle(color: primary)),
  // ),
}

// Container(
// decoration: BoxDecoration(
// color: light,
// borderRadius: BorderRadius.circular(20),
// border: Border.all(color: active, width: .5),
// ),
// padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// child: CustomText(
// text: "Block Driver",
// color: active.withOpacity(.7),
// weight: FontWeight.bold,
// ),
// ),
