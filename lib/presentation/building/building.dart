import 'package:flutter/material.dart';
import 'package:rumbuk_web/constants/controllers.dart';
import 'package:rumbuk_web/helpers/responsiveness.dart';
import 'package:rumbuk_web/presentation/building/building_table.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';
import 'package:get/get.dart';

class BuildingPage extends StatelessWidget {
  const BuildingPage({Key? key}) : super(key: key);

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
        //const Expanded(child: BuildingTable())
      ],
    );
  }
}
