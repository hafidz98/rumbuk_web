import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/controllers/navigation_controller.dart';
import 'package:rumbuk_web/data/network/client/api_client.dart';
import 'package:rumbuk_web/data/network/mapper/network_mapper.dart';
import 'package:rumbuk_web/data/repository/building_repository.dart';
import 'package:rumbuk_web/pages/errors/error_page.dart';
import 'package:rumbuk_web/presentation/building/controller/building_controller.dart';
import 'package:rumbuk_web/routing/routes.dart';

import 'controllers/menu_controller.dart';
import 'layout.dart';
import 'pages/authentication/authentication.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(CustomMenuController());
  Get.put(NavigationController());

  Get.lazyPut(() => BuildingController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: rootRoute,
      unknownRoute: GetPage(
          name: "/not-found",
          page: () => const PageNotFound(),
          transition: Transition.fadeIn),
      getPages: [
        GetPage(name: rootRoute, page: () => SiteLayout()),
        GetPage(
            name: authenticationPageRoute,
            page: () => const AuthenticationPage())
      ],
      debugShowCheckedModeBanner: false,
      title: "Dashboard",
      theme: ThemeData(
          scaffoldBackgroundColor: lightGrey,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: secondaryColor),
          // pageTransitionsTheme: const PageTransitionsTheme(builders: {
          //   TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          //   TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          // }),
          pageTransitionsTheme: PageTransitionsTheme(
            // makes all platforms that can run Flutter apps display routes without any animation
            builders: {
              for (var k in TargetPlatform.values.toList())
                k: const _InanimatePageTransitionsBuilder()
            },
          ),
          primaryColor: primaryColor),
    );
  }
}

class _InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
  const _InanimatePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}

// https://dexterx.dev/creating-a-responsive-flutter-application-with-a-navigation-drawer/