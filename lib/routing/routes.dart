const rootRoute = "/";

const overViewPageName = "Overview";
const overViewPageRoute = "/overview";

// const driversPageName = "Drivers";
// const driversPageRoute = "/drivers";
//
// const clientsPageName = "Clients";
// const clientsPageRoute = "/clients";

const buildingPageName = "Building";
const buildingPageRoute = "/building";

const floorPageName = "Floor";
const floorPageRoute = "/floor";

const roomPageName = "Room";
const roomPageRoute = "/room";

const roomTimePageName = "Room Time";
const roomTimePageRoute = "/room_time";

const timeSlotPageName = "Time Slot";
const timeSlotPageRoute = "/time_slot";

const authenticationPageName = "Log Out";
const authenticationPageRoute = "/auth";

const reservationPageName = "Reservation";
const reservationPageRoute = "/reservation";

const staffPageName = "Staff";
const staffPageRoute = "/staff";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(overViewPageName, overViewPageRoute),
  MenuItem(reservationPageName, reservationPageRoute),
  MenuItem(roomPageName, roomPageRoute),
  MenuItem(floorPageName, floorPageRoute),
  MenuItem(buildingPageName, buildingPageRoute),
  MenuItem(timeSlotPageName, timeSlotPageRoute),
  MenuItem(roomTimePageName, roomTimePageRoute),
  MenuItem(staffPageName, timeSlotPageRoute),
];