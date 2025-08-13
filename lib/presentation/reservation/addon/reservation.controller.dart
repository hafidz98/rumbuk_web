import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:id_rumbuk_app/auth/auth.controller.dart';
import 'package:rumbuk_web/presentation/reservation/addon/components/mapper.exception.dart';
import 'package:rumbuk_web/presentation/reservation/addon/dto/avail_room_response.dart'
    as avr;
import 'package:rumbuk_web/presentation/reservation/addon/dto/building_response.dart';
import 'package:rumbuk_web/presentation/reservation/addon/dto/reservation_create_request.dart';
import 'package:rumbuk_web/presentation/reservation/addon/entity/building.dart';
import 'package:intl/intl.dart';
import 'package:rumbuk_web/presentation/reservation/addon/reservation.service.dart';

class ReservationController2 extends GetxController {
  //late final AuthController _authController;
  late final ReservationService _reservationService;

  final TextEditingController studentIdFieldController = TextEditingController();

  var activityControllerText = TextEditingController();

  final reservationLoading = false.obs;

  late ReservationCreateRequest reqData = ReservationCreateRequest();

  late RxList<BuildingEntity> buildingList =
      List<BuildingEntity>.empty(growable: true).obs;

  late RxList<avr.Building> buildingRoomList =
      List<avr.Building>.empty(growable: true).obs;
  late RxList<avr.Floor> floorRoomList =
      List<avr.Floor>.empty(growable: true).obs;

  final EasyInfiniteDateTimelineController eIDTController =
      EasyInfiniteDateTimelineController();
  final DateTime appsFirstDate = DateTime.now();
  late DateTime focusDate = DateTime.now().add(const Duration(days: 4));
  final DateTime appsLastDate = DateTime.now().add(const Duration(days: 30));

  late DateTime selectedDate;

  RxInt selectedChipButton = 0.obs;
  RxInt selectedBuildingId = 0.obs;

  RxInt selectedRoomTimeIndex = 0.obs;
  RxBool isSelectedRoomTimeButton = false.obs;
  RxInt selectedRTSID = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    _reservationService = Get.put(ReservationService());
    //_authController = Get.find();
    selectedDate = focusDate;

    await getAvailRoomData();

    printInfo(info: selectedDate.toString());
    printInfo(info: selectedBuildingId.value.toString());
    printInfo(info: 'data lantai:${buildingRoomList[0].floors![0].name!}');
  }

  Future<void> getAvailRoomData() async {
    var date = DateFormat('yyyy-MM-dd');
    final List<avr.Building> buildings = [];

    try {
      var buildingData = await _reservationService.fetchRoom(
          "", date.format(selectedDate));
      for (int i = 0; i < buildingData.data!.buildings!.length; i++) {
        buildings.add(buildingData.data!.buildings![i]);
      }
      buildingRoomList.clear();
      buildingRoomList.addAll(buildings);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> makeReservation(BuildContext context) async {
    reservationLoading.value = true;

    var activityText = activityControllerText.text;
    var dateFormatted = DateFormat("yyyy-MM-dd", 'id-ID').format(selectedDate);

    var reqData = ReservationCreateRequest(
      studentId: studentIdFieldController.text,
      activity: activityText,
      bookingDate: dateFormatted,
      roomTimeslotId: selectedRTSID.value,
    );

    printInfo(info: '> makeReservation(): [reqdata]:$reqData');

    try {
      await _reservationService.createReservation(
          "", reqData.toJson());
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      activityControllerText.clear();
      reservationLoading.value = false;
      await getAvailRoomData();
      if (context.mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Reservasi sukses')));
      }
    }
  }

  @override
  Future<void> refresh() async{
    await getAvailRoomData();
  }
}

class BuildingMapper {
  BuildingEntity toBuildingEntity(Building building) {
    try {
      return BuildingEntity(name: building.name, id: building.id);
    } catch (e) {
      throw MapperException<Building, BuildingEntity>(e.toString());
    }
  }

  List<BuildingEntity> toBuildingEntities(List<Building> buildingList) {
    final List<BuildingEntity> buildingEntities = [];

    for (final building in buildingList) {
      try {
        buildingEntities.add(toBuildingEntity(building));
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    return buildingEntities;
  }
}
