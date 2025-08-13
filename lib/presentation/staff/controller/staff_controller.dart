import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/staff/model/staff.dart';
import 'package:rumbuk_web/presentation/staff/service/staff_service.dart';
import 'package:rumbuk_web/presentation/staff/widgets/staff_edit_form.dart';
import 'package:rumbuk_web/presentation/staff/widgets/staff_new_form.dart';

class StaffController extends GetxController {
  final _staffService = StaffService();

  late RxList<Staff> staffList = <Staff>[].obs;

  final TextEditingController idField = TextEditingController();
  final TextEditingController nameField = TextEditingController();
  final TextEditingController emailField = TextEditingController();
  final TextEditingController roleField = TextEditingController();
  final TextEditingController passField = TextEditingController();

  var drawerIndex = 0.obs;

  Future<void> getStaffData() async {
    // const String token = '';
    var fetchData = await _staffService.staffFloor();

    if (fetchData != null) {
      staffList.assignAll(fetchData);
    }
  }

  Future<bool> newStaff() async {
    // const String token = '';
    var data = Staff(
      id: idField.text,
      name: nameField.text,
      role: roleField.text,
      email: emailField.text,
      password: passField.text
    );

    if (kDebugMode) {
      print('data: $data');
    }

    var res = await _staffService.createStaff(data);
    return res;
  }

  @override
  void onInit() {
    getStaffData();
    super.onInit();
  }

  @override
  void refresh() {
    getStaffData();
  }

  @override
  void onClose() {
    nameField.dispose();
    super.onClose();
  }

  Widget getDrawer() {
    switch (drawerIndex.value) {
      case 0:
        return const StaffNewForm();
      case 1:
        return const StaffEditForm();
      default:
        return Container();
    }
  }
}
