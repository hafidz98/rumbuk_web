const rootRoute = "/";

const overViewPageName = "Overview";
const overViewPageRoute = "/overview";

const driversPageName = "Drivers";
const driversPageRoute = "/drivers";

const clientsPageName = "Clients";
const clientsPageRoute = "/clients";

const buildingPageName = "Building";
const buildingPageRoute = "/building";

const roomPageName = "Room";
const roomPageRoute = "/room";

const authenticationPageName = "Log Out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(overViewPageName, overViewPageRoute),
  MenuItem(buildingPageName, buildingPageRoute),
  MenuItem(roomPageName, roomPageRoute),
];