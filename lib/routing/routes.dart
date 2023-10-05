const rootRoute = "/";

const overViewPageName = "Overview";
const overViewPageRoute = "/overview";

const driversPageName = "Drivers";
const driversPageRoute = "/drivers";

const clientsPageName = "Clients";
const clientsPageRoute = "/clients";

const buildingPageName = "Building";
const buildingPageRoute = "/building";

const authenticationPageName = "Log Out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(overViewPageName, overViewPageRoute),
  MenuItem(driversPageName, driversPageRoute),
  MenuItem(clientsPageName, clientsPageRoute),
  MenuItem(buildingPageName, buildingPageRoute),
  MenuItem(authenticationPageName, authenticationPageRoute),
];