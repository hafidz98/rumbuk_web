import 'package:flutter/material.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/helpers/responsiveness.dart';
import 'package:rumbuk_web/widgets/side_menu_item.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/constants/controllers.dart';
import '../pages/authentication/authentication.dart';
import 'package:rumbuk_web/routing/routes.dart';
import 'custom_text.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: light,
        border: Border(
          right: BorderSide(
            color: dark.withValues(alpha: 0.1),
            width: 1.5
          )
        )
      ),
      //color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 40),
                Row(
                  children: [
                    SizedBox(width: width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset(
                        "assets/icons/icon1.png",
                        width: 28,
                      ),
                    ),
                    Flexible(
                        child: CustomText(
                      text: "Rumbuk Dashboard",
                      size: 20,
                      weight: FontWeight.bold,
                      color: active,
                    )),
                    SizedBox(width: width / 48),
                  ],
                ),
              ],
            ),
          //Divider(color: lightGrey),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map(
                  (item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      if (item.route == authenticationPageRoute) {
                        menuController.changeActiveItemTo(overViewPageRoute);
                        Get.offAllNamed(authenticationPageRoute);
                      }

                      if (!menuController.isActive(item.name)) {
                        menuController.changeActiveItemTo(item.name);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(item.route);
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
