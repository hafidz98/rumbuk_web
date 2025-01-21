import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/building_v_2/model/building.dart';
import 'package:rumbuk_web/presentation/building_v_2/service/building_service.dart';
import 'package:rumbuk_web/presentation/building_v_2/widgets/building_edit_form.dart';
import 'package:rumbuk_web/presentation/building_v_2/widgets/building_new_form.dart';

class Building2Controller extends GetxController {
  final _buildingService = BuildingService();
  late RxList<Building> buildingList = <Building>[].obs;

  final TextEditingController buildingNameField = TextEditingController();

  var drawerIndex = 0.obs;

  Future<void> getBuildingData() async {
    // const String token = '';
    var fetchData = await _buildingService.fetchBuilding();

    if (fetchData != null) {
      buildingList.assignAll(fetchData);
    }
  }

  Future<bool> newBuilding() async {
    // const String token = '';
    var data = Building(
      name: buildingNameField.text,
    );

    if (kDebugMode) {
      print('data Building: $data');
    }

    var res = await _buildingService.createBuilding(data);
    return res;
  }

  @override
  void onInit() {
    getBuildingData();
    super.onInit();
  }

  @override
  void refresh() {
    getBuildingData();
  }

  @override
  void onClose() {
    buildingNameField.dispose();
    super.onClose();
  }

  Widget getDrawer() {
    switch (drawerIndex.value) {
      case 0:
        return const BuildingNewForm();
      case 1:
        return const BuildingEditForm();
      default:
        return Container();
    }
  }
}
