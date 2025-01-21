// import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/building/model/building.dart';
import 'package:rumbuk_web/presentation/building/service/building_service.dart';
// import 'package:rumbuk_web/data/api_init.dart';
// import 'package:rumbuk_web/data/network/client/building_service.dart';
// import 'package:rumbuk_web/data/repository/building_repository.dart';
// import 'package:rumbuk_web/domain/model/building.dart';

class BuildingController extends GetxController {
  late final BuildingService _buildingService;
  late RxList<TimeSlot> buildings = <TimeSlot>[].obs;
  final RxBool isLoading = false.obs;

  Future<void> getBuildings() async {
    isLoading.value = true;
    try {
      const String token = ''; // Replace with actual token retrieval logic
      final fetchedBuildings = await _buildingService.fetchBuilding(token);
      printInfo(info: fetchedBuildings.toString());
      // if (kDebugMode) {
      //   print('Error in getBuildings: $fetchedBuildings');
      // }
      if (fetchedBuildings != null) {
        buildings.assignAll(fetchedBuildings);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in getBuildings: $e');
      }
      //throw Exception(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() async {
    _buildingService = Get.put(BuildingService());
    await getBuildings();
    super.onInit();
  }
}

// class BuildingController extends GetxController {
//   final buildingRepository = BuildingRepository(
//     apiClient: ApiInit().apiClient,
//     networkMapper: ApiInit().networkMapper(),
//   );
//
//   final buildingList = List<Building>.empty(growable: true).obs;
//
//   void fetchBuildingData() async {
//     var buildings = await buildingRepository.getBuildings();
//     log("Data [buildings]: $buildings");
//
//     if (buildings.isNotEmpty) {
//       buildingList.assignAll(buildings);
//     }
//
//     log("Data [buildingList]: $buildingList");
//   }
// }
