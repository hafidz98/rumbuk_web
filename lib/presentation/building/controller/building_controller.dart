import 'dart:developer';

import 'package:get/get.dart';
import 'package:rumbuk_web/data/api_init.dart';
import 'package:rumbuk_web/data/network/client/building_service.dart';
import 'package:rumbuk_web/data/repository/building_repository.dart';
import 'package:rumbuk_web/domain/model/building.dart';

class BuildingController extends GetxController {
  final buildingRepository = BuildingRepository(
    apiClient: ApiInit().apiClient,
    networkMapper: ApiInit().networkMapper(),
  );

  final buildingList = List<Building>.empty(growable: true).obs;

  void fetchBuildingData() async {
    var buildings = await buildingRepository.getBuildings();
    log("Data [buildings]: $buildings");

    if (buildings.isNotEmpty) {
      buildingList.assignAll(buildings);
    }

    log("Data [buildingList]: $buildingList");
  }
}
