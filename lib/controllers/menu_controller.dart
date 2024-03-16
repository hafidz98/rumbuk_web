import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/routing/routes.dart';

class CustomMenuController extends GetxController {
  static CustomMenuController instance = Get.find();
  var activeItem = overViewPageName.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case roomPageName:
        return _customIcon(Icons.room, itemName);
      case overViewPageName:
        return _customIcon(Icons.trending_up, itemName);
      case buildingPageName:
        return _customIcon(Icons.business_rounded, itemName);
      case authenticationPageName:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 22,
        color: dark,
      );
    }

    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey);
  }
}