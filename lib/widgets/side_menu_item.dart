import 'package:flutter/material.dart';
import 'package:rumbuk_web/widgets/horizontal_menu_item.dart';
import 'package:rumbuk_web/widgets/vertical_menu_item.dart';
import 'package:rumbuk_web/helpers/responsiveness.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;

  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomScreen(context)) {
      return VerticalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    } else {
      return HorizontalMenuItem(
        itemName: itemName,
        onTap: onTap,
      );
    }
  }
}
