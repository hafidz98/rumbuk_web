import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/controllers/navigation_controller.dart';
import 'package:rumbuk_web/data/network/client/api_client.dart';
import 'package:rumbuk_web/data/network/network_mapper.dart';
import 'package:rumbuk_web/data/repository/building_repository.dart';
import 'package:rumbuk_web/pages/errors/error_page.dart';
import 'package:rumbuk_web/routing/routes.dart';

import 'controllers/menu_controller.dart';
import 'layout.dart';
import 'pages/authentication/authentication.dart';

// class InitialData {
//   final List<SingleChildWidget> providers;
//
//   InitialData({required this.providers});
// }
//
// Future<InitialData> _createdData() async {
//
//   final log = Logger(
//     printer: PrettyPrinter(),
//     level: kDebugMode ? Level.trace : Level.off,
//   );
//
//   final apiClient = ApiClient(baseUrl: "http://localhost:8991/v1", apiKey: "", apiHost: "");
//
//   final networkMapper = NetworkMapper(log: log);
//
//   final buildingRepo = BuildingRepository(apiClient: apiClient, networkMapper: networkMapper);
//
//   return InitialData(providers: [
//     Provider<Logger>.value(value: log),
//     Provider<BuildingRepository>.value(value: buildingRepo),
//   ]);
// }

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  //
  // final data = await _createdData();
  //
  Get.put(CustomMenuController());
  Get.put(NavigationController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //final InitialData data;
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: rootRoute,
      unknownRoute: GetPage(name: "/not-found", page: () => const PageNotFound(), transition: Transition.fadeIn),
      getPages: [
        GetPage(name: rootRoute, page: () => SiteLayout()),
        GetPage(name: authenticationPageRoute, page: () => const AuthenticationPage())
      ],
      debugShowCheckedModeBanner: false,
      title: "Dashboard",
      theme: ThemeData(
          scaffoldBackgroundColor: light,
          textTheme: GoogleFonts.mulishTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.black),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          }),
          primaryColor: Colors.blue),
    );
  }
}
