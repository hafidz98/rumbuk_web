import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rumbuk_web/presentation/building_v_2/service/building_service.dart';
import 'package:rumbuk_web/presentation/building_v_2/model/building.dart';
import 'package:rumbuk_web/presentation/reservation/model/reservation.dart';
import 'package:rumbuk_web/presentation/reservation/model/reservation_responses.dart';
import 'package:rumbuk_web/presentation/reservation/service/reservation_service.dart';
import 'package:rumbuk_web/presentation/reservation/widgets/reservation_edit_form.dart';
import 'package:rumbuk_web/presentation/reservation/widgets/reservation_new_form.dart';

class ReservationController extends GetxController {
  final _floorService = ReservationService();
  final _buildingService = BuildingService();
  late RxList<Reservation> floorList = <Reservation>[].obs;
  late RxList<Building> buildingList = <Building>[].obs;
  Building? buildingData;
  final TextEditingController floorNameField = TextEditingController();

  final formatDate = DateFormat("dd MMMM yyyy");
  ReservationModel? reservationData;
  final _reservationService = ReservationService();
  late RxList<ReservationModel> reservationList = <ReservationModel>[].obs;

  var drawerIndex = 0.obs;

  Future<void> getReservationListData() async {
    var fetchReservationData = await _reservationService.fetchAllReservation();

    if (fetchReservationData!.isNotEmpty) {
      reservationList.assignAll(fetchReservationData);
    }

    if (kDebugMode) {
      print(reservationList);
    }
  }

  // Future<void> getFloorData() async {
  //   // const String token = '';
  //   var fetchData = await _floorService.fetchAllReservation();
  //
  //   if (fetchData != null) {
  //     floorList.assignAll(fetchData);
  //   }
  // }

  // Future<bool> newFloor() async {
  //   // const String token = '';
  //   var data = Reservation(
  //     name: floorNameField.text,
  //     buildingId: buildingData?.id,
  //   );
  //
  //   if (kDebugMode) {
  //     print('data Building: $data');
  //   }
  //
  //   var res = await _floorService.createFloor(data);
  //   return res;
  // }

  // Future<void> getBuildingData() async {
  //   //const String token = '';
  //   var fetchData = await _buildingService.fetchBuilding();
  //
  //   if (fetchData != null) {
  //     buildingList.assignAll(fetchData);
  //   }
  // }

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
    // getFloorData();
    // getBuildingData();
    getReservationListData();
    super.onInit();
  }

  @override
  void refresh() {
    //getFloorData();
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

enum ReservationStatus {
  canceled('Dibatalkan', '0', Colors.red),
  upcoming('Akan datang', '1', Colors.blue),
  ongoing('Sedang berjalan', '2', Colors.orange),
  done('Selesai', '3', Colors.green);

  final String description;
  final String code;
  final Color color;

  const ReservationStatus(this.description, this.code, this.color);

  static ReservationStatus? fromCode(String code) =>
      ReservationStatus.values.firstWhere(
        (status) => status.code == code,
      );

  Map<String, dynamic> toMap() => {
        'description': description,
        'code': code,
        'color': color,
      };
}
