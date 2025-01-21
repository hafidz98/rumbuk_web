import 'package:flutter/material.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.scaffoldKey});
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          scaffoldKey.currentState!.openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      primary: true,
      elevation: 2,
      actions: [
        CustomText(
          text: "Hafidz",
          color: dark,
          weight: FontWeight.bold,
        ),
        const SizedBox(width: 16),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.all(2),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person_outline,
              color: dark,
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Visibility(
              child: CustomText(
                text: appBarTitle,
                color: dark,
                size: 16,
                weight: FontWeight.bold,
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      //iconTheme: const IconThemeData(color: Colors.blue, weight: 20),
      backgroundColor: light,
      surfaceTintColor: Colors.white,
    );
  }
}
