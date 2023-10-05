import 'package:flutter/material.dart';
import 'package:rumbuk_web/pages/clients/clients.dart';
import 'package:rumbuk_web/pages/drivers/drivers.dart';
import 'package:rumbuk_web/presentation/building/building.dart';
import 'package:rumbuk_web/presentation/building/building_table.dart';
import 'package:rumbuk_web/routing/routes.dart';

import 'package:rumbuk_web/pages/overview/overview.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overViewPageRoute:
      return _getPageRoute( OverViewPage());
    case buildingPageRoute:
      return _getPageRoute(const BuildingPage());
    case driversPageRoute:
      return _getPageRoute(const DriversPage());
    case clientsPageRoute:
      return _getPageRoute(const ClientsPage());
    default:
      return _getPageRoute( OverViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
