import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/constants/controllers.dart';
import 'package:rumbuk_web/helpers/responsiveness.dart';
import 'package:rumbuk_web/pages/overview/widgets/overview_card_medium.dart';
import 'package:rumbuk_web/pages/overview/widgets/overview_card_small.dart';
import 'package:rumbuk_web/pages/overview/widgets/revenue_section_small.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

import '../../constants/style.dart';
import 'widgets/available_drivers.dart';
import 'widgets/overview_card_large.dart';
import 'widgets/revenue_section_large.dart';

class OverViewPage extends StatelessWidget {
  OverViewPage({Key? key}) : super(key: key);

  final _row = List<DataRow>.generate(
    20,
    (index) => DataRow(
      cells: [
        const DataCell(CustomText(text: "Santos Enoque")),
        const DataCell(CustomText(text: "New yourk city")),
        const DataCell(Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.deepOrange, size: 18),
            SizedBox(width: 5),
            CustomText(text: "4.5"),
          ],
        )),
        DataCell(
          Container(
              decoration: BoxDecoration(
                color: light,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: active, width: .5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: CustomText(
                text: "Assign Delivery",
                color: active.withOpacity(.7),
                weight: FontWeight.bold,
              )),
        ),
      ],
    ),
  );

  static const List<DataColumn> _columns = [
    DataColumn(label: Text("Name")),
    DataColumn(label: Text('Location')),
    DataColumn(label: Text('Rating')),
    DataColumn(label: Text('Action')),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() => Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                  child: CustomText(
                    text: menuController.activeItem.value,
                    size: 24,
                    weight: FontWeight.bold,
                  ),
                )
              ],
            )),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context) ||
                  ResponsiveWidget.isMediumScreen(context))
                if (ResponsiveWidget.isCustomScreen(context))
                  const OverviewCardMediumScreen()
                else
                  const OverviewCardLargeScreen()
              else
                const OverviewCardSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context))
                const RevenueSectionLarge()
              else
                const RevenueSectionSmall(),
              //AvailableDrivers()
              AvailableDriversTable(
                dataColumn: _columns,
                dataRow: _row,
              )
            ],
          ),
        )
      ],
    );
  }
}
