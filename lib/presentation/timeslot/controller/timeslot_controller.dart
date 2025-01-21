

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/timeslot/widgets/timeslot_new_form.dart';
import 'package:rumbuk_web/presentation/timeslot/model/timeslot.dart';
import 'package:rumbuk_web/presentation/timeslot/service/timeslot_service.dart';

import 'package:rumbuk_web/presentation/timeslot/widgets/timeslot_edit_form.dart';

class TimeSlotController extends GetxController {
  final _timeSlotService = TimeSlotService();
  late RxList<TimeSlot> timeSlot = <TimeSlot>[].obs;

  final TextEditingController endTimeField = TextEditingController();
  final TextEditingController startTimeField = TextEditingController();
  final TextEditingController durationField = TextEditingController();

  var drawerIndex = 0.obs;

  Future<void> getTimeSlotData() async {
    // const String token = '';
    var fetchTimeSlotData = await _timeSlotService.fetchTimeSlot();

    if (fetchTimeSlotData != null) {
      timeSlot.assignAll(fetchTimeSlotData);
    }
  }

  Future<bool> newTimeSlot() async {
    // const String token = '';
    var data = TimeSlot(
        startTime: startTimeField.text,
        endTime: endTimeField.text,
        duration: int.parse(durationField.text));

    if (kDebugMode) {
      print('data Timeslot: $data');
    }

    var res = await _timeSlotService.createTimeSlot(data);
    return res;
  }

  @override
  void onInit() {
    getTimeSlotData();
    super.onInit();
  }

  @override
  void refresh() {
    getTimeSlotData();
  }

  @override
  void onClose() {
    endTimeField.dispose();
    startTimeField.dispose();
    durationField.dispose();
    super.onClose();
  }

  Widget getDrawer() {
    switch (drawerIndex.value) {
      case 0:
        return const TimeSlotNewForm();
      case 1:
        return const TimeSlotEditForm();
      default:
        return Container();
    }
  }
}
