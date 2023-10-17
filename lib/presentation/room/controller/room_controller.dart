import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/domain/services/room_service.dart';

import '../../../domain/model/room.dart';
import '../../building/widgets/formfield.dart';
import '../widgets/room_edit_form.dart';

class RoomController extends GetxController {
  final _roomService = RoomService();
  final roomList = List<Room>.empty(growable: true).obs;

  final roomNameController = TextEditingController();

  var drawerIndex = 0.obs;
  Room? roomData;


  Widget getDrawer(){
    switch (drawerIndex.value) {
      case 0:
        return const FormFieldTable();
      case 1:
        return const RoomEditForm();
      default:
        return Container();
    }
  }

  Future<RxList<Room>> _getRoomListData() async {
    var room = await _roomService.getRoomList();
    log("[Controller:Room][Data]: $room");

    if (room.isNotEmpty){
      roomList.assignAll(room);
    }
    log("[Controller:Room][roomList]: $roomList");

    return roomList;
  }

  @override
  void onInit() {
    _getRoomListData();
    log("[Controller:Room][roomData]: $roomData");
    super.onInit();
  }
}