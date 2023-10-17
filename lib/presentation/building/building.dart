import 'package:flutter/material.dart';
import 'package:rumbuk_web/constants/controllers.dart';
import 'package:rumbuk_web/helpers/responsiveness.dart';
import 'package:rumbuk_web/presentation/building/building_table.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';
import 'package:get/get.dart';

import 'widgets/formfield.dart';

class BuildingPage extends StatelessWidget {
  BuildingPage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        elevation: 16,
        child: FormFieldTable(),
      ),
      body: Column(
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
          const Expanded(child: BuildingTable())
        ],
      ),
    );
  }
}
