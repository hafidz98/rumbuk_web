import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/building_v_2/service/building_service.dart';
import 'package:rumbuk_web/presentation/building_v_2/model/building.dart';
import 'package:rumbuk_web/presentation/floor/model/floor.dart';
import 'package:rumbuk_web/presentation/floor/service/floor_service.dart';
import 'package:rumbuk_web/presentation/floor/widgets/floor_edit_form.dart';
import 'package:rumbuk_web/presentation/floor/widgets/floor_new_form.dart';

class FloorController extends GetxController {
  final _floorService = FloorService();
  final _buildingService = BuildingService();
  late RxList<Floor> floorList = <Floor>[].obs;
  late RxList<Building> buildingList = <Building>[].obs;
  Building? buildingData;
  final TextEditingController floorNameField = TextEditingController();

  var drawerIndex = 0.obs;

  Future<void> getFloorData() async {
    // const String token = '';
    var fetchData = await _floorService.fetchFloor();

    if (fetchData != null) {
      floorList.assignAll(fetchData);
    }
  }

  Future<bool> newFloor() async {
    // const String token = '';
    var data = Floor(
      name: floorNameField.text,
      buildingId: buildingData?.id,
    );

    if (kDebugMode) {
      print('data Building: $data');
    }

    var res = await _floorService.createBuilding(data);
    return res;
  }

  Future<void> getBuildingData() async {
    //const String token = '';
    var fetchData = await _buildingService.fetchBuilding();

    if (fetchData != null) {
      buildingList.assignAll(fetchData);
    }
  }

  List<DropdownMenuItem> getBuildingDropdownMenuItem() {
    return buildingList.map(
          (element) {
        return DropdownMenuItem(
          value: element,
          child: Text(element.name),
        );
      },
    ).toList();
  }

  @override
  void onInit() {
    getFloorData();
    getBuildingData();
    super.onInit();
  }

  @override
  void refresh() {
    getFloorData();
  }

  @override
  void onClose() {
    floorNameField.dispose();
    super.onClose();
  }

  Widget getDrawer() {
    switch (drawerIndex.value) {
      case 0:
        return const FloorNewForm();
      case 1:
        return const FloorEditForm();
      default:
        return Container();
    }
  }
}
