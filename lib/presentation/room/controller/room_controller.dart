import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/domain/model/building.dart';
import 'package:rumbuk_web/domain/model/floor.dart';
import 'package:rumbuk_web/domain/services/room_service.dart';
import 'package:rumbuk_web/presentation/room/widgets/room_new_form.dart';

import '../../../domain/model/room.dart';
import '../widgets/room_edit_form.dart';

class RoomController extends GetxController {
  final _roomService = RoomService();

  final roomList = List<Room>.empty(growable: true).obs;
  final buildingList = List<Building>.empty(growable: true).obs;

  final TextEditingController roomNameController = TextEditingController();
  final TextEditingController roomCapacityController = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();

  var listBuildingData = [].obs;
  var drawerIndex = 0.obs;

  Room? roomData;
  Building? buildingData;
  // Floor?  floorData;

  @override
  void onInit() {
    isiDataDiBuildingList();
    super.onInit();
    _getRoomListData();
    buildingData = buildingList.first;
    log("[Controller:Room][roomData]: $roomData");
  }

  @override
  void refresh() {
    _getRoomListData();
  }

  @override
  void onClose() {
    roomNameController.dispose();
    roomCapacityController.dispose();
    buildingNameController.dispose();
    super.onClose();
  }

  Widget getDrawer() {
    switch (drawerIndex.value) {
      case 0:
        return const RoomNewForm();
      case 1:
        return const RoomEditForm();
      default:
        return Container();
    }
  }

  Future<RxList<Room>> _getRoomListData() async {
    var room = await _roomService.getRoomList();
    log("[Controller:Room][Data]: $room");

    if (room.isNotEmpty) {
      roomList.assignAll(room);
    }
    log("[Controller:Room][roomList]: $roomList");
    return roomList;
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

  void isiDataDiBuildingList() {
    buildingList.add(const Building(id: "1", name: "Gedung 1"));
    buildingList.add(const Building(id: "2", name: "Auditorium 2"));
    buildingList.add(const Building(id: "3", name: "Ruang 1"));
    buildingList.add(const Building(id: "4", name: "Labs 1"));
    buildingList.add(const Building(id: "5", name: "Labs 2"));
    buildingList.add(const Building(id: "6", name: "Ruang 2"));
  }
}
