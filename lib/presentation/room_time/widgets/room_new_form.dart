import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/room/controller/room_controller.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_dropdownmenu2.dart';
import '../../../widgets/custom_text.dart';

class RoomNewForm extends StatefulWidget {
  const RoomNewForm({Key? key}) : super(key: key);

  @override
  State<RoomNewForm> createState() => _RoomNewFormState();
}

class _RoomNewFormState extends State<RoomNewForm> {
  final _controller = Get.put(RoomController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
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
                text: "Tambah Ruangan Baru",
                color: active.withOpacity(.7),
                weight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _controller.roomNameController,
              validator: (value) {
                return value == null || value.isEmpty
                    ? 'Form tidak boleh kosong'
                    : null;
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                hintText: "Ruangan Baru",
                label: Text("Nama Ruangan"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _controller.roomCapacityController,
              validator: (value) {
                return value == null || value.isEmpty
                    ? 'Form tidak boleh kosong'
                    : null;
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                hintText: "Kapasitas Ruangan",
                label: Text("Kapasitas"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomText(
                text: "Lokasi Ruangan",
                color: active.withOpacity(.7),
                weight: FontWeight.normal,
              ),
            ),
            // CustomDropdownButton2(
            //   hint: const Text("Pilih Gedung"),
            //   dropdownItems: _controller.getBuildingDropdownMenuItem(),
            //   onChanged: (value) =>
            //       setState(() => _controller.buildingData = value),
            // ),
            // const SizedBox(height: 16),
            // CustomDropdownButton2(
            //   hint: const Text("Pilih Lantai"),
            //   dropdownItems: _controller.getBuildingDropdownMenuItem(),
            //   onChanged: (value) =>
            //       setState(() => _controller.buildingData = value),
            // ),
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
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snack bar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Menyimpan')),
                      );
                      Scaffold.of(context).closeEndDrawer();
                      _controller.refresh();
                      log("Building name: ${_controller.roomNameController.text}");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(60.0, 40.0)),
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
