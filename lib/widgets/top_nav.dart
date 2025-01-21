import 'package:flutter/material.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/helpers/responsiveness.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      // foregroundColor: Colors.white,
      // backgroundColor: Colors.white,
      leading: IconButton(
        onPressed: () {
          key.currentState!.openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      primary: true,
      elevation: 2,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Visibility(
              child: CustomText(
                text: appBarTitle,
                color: light,
                size: 16,
                weight: FontWeight.normal,
              ),
            ),
            Expanded(child: Container()),
            const SizedBox(
              width: 24,
            ),
            CustomText(
              text: "Hafidz",
              color: light,
            ),
            const SizedBox(
              width: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  //color: active.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(30)),
                  padding: const EdgeInsets.all(2),
                  margin: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: light,
                    child: Icon(
                      Icons.person_outline,
                      color: dark,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      //iconTheme: const IconThemeData(color: Colors.blue, weight: 20),
      //backgroundColor: Colors.transparent,
    );

/*
IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: dark.withOpacity(.7),
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: dark.withOpacity(.7),
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: active,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: light, width: 2),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: 1,
            height: 22,
            color: lightGrey,
          ),
 */