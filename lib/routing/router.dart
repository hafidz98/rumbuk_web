import 'package:flutter/material.dart';
import 'package:rumbuk_web/pages/clients/clients.dart';
import 'package:rumbuk_web/pages/drivers/drivers.dart';
import 'package:rumbuk_web/presentation/building/building.dart';
import 'package:rumbuk_web/presentation/room/room_page.dart';
import 'package:rumbuk_web/routing/routes.dart';

import 'package:rumbuk_web/pages/overview/overview.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case roomPageRoute:
      return _getPageRoute(RoomPage());
    case overViewPageRoute:
      return _getPageRoute(OverViewPage());
    case buildingPageRoute:
      return _getPageRoute(BuildingPage());
    case driversPageRoute:
      return _getPageRoute(const DriversPage());
    case clientsPageRoute:
      return _getPageRoute(const ClientsPage());
    default:
      return _getPageRoute(OverViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => Padding(
    padding: const EdgeInsets.all(8.0),
    child: child,
  ));
}
