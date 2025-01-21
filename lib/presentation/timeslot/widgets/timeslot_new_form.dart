import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/room/controller/room_controller.dart';
import 'package:rumbuk_web/presentation/timeslot/controller/timeslot_controller.dart';
import 'package:rumbuk_web/widgets/sidebars/custom_snackbar.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_dropdownmenu2.dart';
import '../../../widgets/custom_text.dart';

class TimeSlotNewForm extends StatefulWidget {
  const TimeSlotNewForm({Key? key}) : super(key: key);

  @override
  State<TimeSlotNewForm> createState() => _TimeSlotNewFormState();
}

class _TimeSlotNewFormState extends State<TimeSlotNewForm> {
  final _controller = Get.put(TimeSlotController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: 550,
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: CustomText(
                text: "Tambah Jam Baru",
                color: active.withValues(alpha: .7),
                weight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _controller.startTimeField,
              validator: (value) {
                return value == null || value.isEmpty
                    ? 'Field tidak boleh kosong'
                    : null;
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                hintText: "Jam mulai, cth: 07:22",
                label: Text("Jam mulai"),
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                MaskedInputFormatter('##:##:00')
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller.endTimeField,
              validator: (value) {
                return value == null || value.isEmpty
                    ? 'Field tidak boleh kosong'
                    : null;
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                hintText: "Jam selesai, cth: 07:22",
                label: Text("Jam selesai"),
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                MaskedInputFormatter('##:##:00')
              ],
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller.durationField,
              validator: (value) {
                return value == null || value.isEmpty
                    ? 'Field tidak boleh kosong'
                    : null;
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                hintText: "Durasi waktu",
                label: Text("Durasi (menit)"),
                border: OutlineInputBorder(),
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Scaffold.of(context).closeEndDrawer();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(60.0, 40.0),
                  ),
                  child: const Text("Batal",
                      style: TextStyle(color: Colors.blueGrey)),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var res = await _controller.newTimeSlot();
                      if (!res) {
                        if (context.mounted) {
                          CustomSnackBar.of(context)
                              .customSnackBar('Gagal simpan');
                        }
                      }
                      _controller.getTimeSlotData();
                      if (context.mounted) {
                        CustomSnackBar.of(context).customSnackBar('Menyimpan');
                      }
                      if (context.mounted) {
                        Scaffold.of(context).closeEndDrawer();
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(60.0, 40.0),
                  ),
                  child: const Text("Simpan"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
