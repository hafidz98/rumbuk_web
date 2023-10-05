import 'dart:developer';

import 'package:get/get.dart';
import 'package:rumbuk_web/data/api_init.dart';
import 'package:rumbuk_web/data/repository/building_repository.dart';

class BuildingController extends GetxController {
  BuildingRepository buildingRepository = BuildingRepository(
      apiClient: ApiInit().apiClient, networkMapper: ApiInit().networkMapper());
  final buildingList = [].obs;

  void fetchBuildingData() async {
    var buildings = await buildingRepository.getBuildings();
    log("Data [buildings]: $buildings");
    if (buildings.isNotEmpty) {
      buildingList.assignAll(buildings);
    }
    log("Data [buildingList]: $buildingList");
  }

}
