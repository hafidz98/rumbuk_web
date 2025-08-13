import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/domain/services/room_service.dart';
import 'package:rumbuk_web/presentation/building_v_2/model/building.dart';
import 'package:rumbuk_web/presentation/building_v_2/service/building_service.dart';
import 'package:rumbuk_web/presentation/floor/model/floor.dart';
import 'package:rumbuk_web/presentation/floor/service/floor_service.dart';
import 'package:rumbuk_web/presentation/room/widgets/room_new_form.dart';
import 'package:rumbuk_web/domain/model/room.dart';
import 'package:rumbuk_web/presentation/room/widgets/room_edit_form.dart';

class RoomController extends GetxController {
  final _roomService = RoomService();
  final _floorService = FloorService();
  final _buildingService = BuildingService();

  final roomList = List<Room>.empty(growable: true).obs;
  final buildingList = List<Building>.empty(growable: true).obs;
  final RxList<Floor> floorList = <Floor>[].obs;

  final TextEditingController roomNameController = TextEditingController();
  final TextEditingController roomCapacityController = TextEditingController();
  final TextEditingController buildingNameController = TextEditingController();

  var listBuildingData = [].obs;
  var drawerIndex = 0.obs;

  Room? roomData;
  Building? buildingDataChosen;
  Floor? floorDataChosen;

  @override
  void onInit() {
    //isiDataDiBuildingList();
    super.onInit();
    _getFloorData();
    _getBuildingData();
    _getRoomListData();
    //floorData = floorList.first;
    //log("[Controller:Room][roomData]: ${floorList[0]}");
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

  Future setActiveStatus(int roomId, String status) async {
    var room = Room(id: roomId, status: status, name: '', capacity: 0);
    if (kDebugMode) {
      print("$room");
    }
    await _roomService.changeRoomActiveStatus(room);
  }

  Future<bool> addNewRoom() async {
    // const String token = '';
    var data = Room(
      floorId: floorDataChosen?.id,
      name: roomNameController.text,
      buildingId: floorDataChosen?.buildingId,
      id: 0,
      capacity: int.parse(roomCapacityController.text),
    );

    if (kDebugMode) {
      print('data Building: $data');
    }

    var res = await _roomService.createRoom(data);
    return res;
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

  Future<void> _getFloorData() async {
    // const String token = '';
    var fetchData = await _floorService.fetchFloor();

    if (fetchData != null) {
      floorList.assignAll(fetchData);
    }
  }

  Future<void> _getBuildingData() async {
    // const String token = '';
    var fetchData = await _buildingService.fetchBuilding();

    if (fetchData != null) {
      buildingList.assignAll(fetchData);
    }
  }

  // List<DropdownMenuItem> getBuildingDropdownMenuItem() {
  //   return floorList.map(
  //         (element) {
  //       return DropdownMenuItem(
  //         value: element.buildingId ?? 0,
  //         child: Text(element.buildingName!),
  //       );
  //     },
  //   ).toList();
  // }
  //
  // List<DropdownMenuItem> getFloorDropdownMenuItem() {
  //   return floorList.map(
  //         (element) {
  //       return DropdownMenuItem(
  //         value: element.id ?? 0,
  //         child: Text(element.name),
  //       );
  //     },
  //   ).toList();
  // }

  // List<DropdownMenuItem> getBuildingDropdownMenuItem() {
  //   return buildingList.map(
  //     (element) {
  //       return DropdownMenuItem(
  //         value: element,
  //         child: Text(element.name),
  //       );
  //     },
  //   ).toList();
  // }
  //
  // void isiDataDiBuildingList() {
  //   buildingList.add(const Building(id: "1", name: "Gedung 1"));
  //   buildingList.add(const Building(id: "2", name: "Auditorium 2"));
  //   buildingList.add(const Building(id: "3", name: "Ruang 1"));
  //   buildingList.add(const Building(id: "4", name: "Labs 1"));
  //   buildingList.add(const Building(id: "5", name: "Labs 2"));
  //   buildingList.add(const Building(id: "6", name: "Ruang 2"));
  // }
}
