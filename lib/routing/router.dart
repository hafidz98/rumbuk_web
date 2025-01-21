import 'package:flutter/material.dart';
import 'package:rumbuk_web/pages/clients/clients.dart';
import 'package:rumbuk_web/pages/drivers/drivers.dart';
import 'package:rumbuk_web/presentation/building/building.dart';
import 'package:rumbuk_web/presentation/building_v_2/building_page.dart';
import 'package:rumbuk_web/presentation/floor/floor_page.dart';
import 'package:rumbuk_web/presentation/reservation/reservation_page.dart';
import 'package:rumbuk_web/presentation/room/room_page.dart';
import 'package:rumbuk_web/presentation/room_time/room_time_page.dart';
import 'package:rumbuk_web/presentation/staff/staff_page.dart';
import 'package:rumbuk_web/presentation/timeslot/timeslot_page.dart';
import 'package:rumbuk_web/routing/routes.dart';

import 'package:rumbuk_web/pages/overview/overview.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case roomPageRoute:
      return _getPageRoute(const RoomPage());
    case overViewPageRoute:
      return _getPageRoute(OverViewPage());
    case buildingPageRoute:
      return _getPageRoute(Building2Page());
    case timeSlotPageRoute:
      return _getPageRoute(const TimeSlotPage());
    case roomTimePageRoute:
      return _getPageRoute(RoomTimePage());
    case floorPageRoute:
      return _getPageRoute(FloorPage());
    case reservationPageRoute:
      return _getPageRoute(ReservationPage());
    case staffPageRoute:
      return _getPageRoute(StaffPage());
    // case driversPageRoute:
    //   return _getPageRoute(const DriversPage());
    // case clientsPageRoute:
    //   return _getPageRoute(const ClientsPage());
    default:
      return _getPageRoute(OverViewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
