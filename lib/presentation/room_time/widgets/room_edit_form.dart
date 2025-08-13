import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/room_time/controller/room_controller.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_text.dart';

class RoomEditForm extends StatefulWidget {
  const RoomEditForm({Key? key}) : super(key: key);

  @override
  State<RoomEditForm> createState() => _RoomEditFormState();
}

class _RoomEditFormState extends State<RoomEditForm> {
  final _formKey = GlobalKey<FormState>();
  final controller = Get.find<RoomController>();
  final _buildingNameController = TextEditingController();

  String? Function(String?)? get validator => (value) {
    if (value == null || value.isEmpty) {
      return 'Tolong masukkan nama ruangan';
    }
    return null;
  };

  @override
  void dispose() {
    _buildingNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.only(right: 8, left: 8,bottom: 8),
      width: 550,
      color: Colors.white,
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CustomText(
                text: "Ubah Ruangan",
                color: active.withOpacity(.7),
                weight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            TextFormField(
              controller: _buildingNameController,
              validator: (value) {
                // if (value == null || value.isEmpty) {
                //   return 'Please enter some text';
                // }
                // return null;

                return validator?.call(value);
              },
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                hintText: "Masukkan nama ruangan",
                label: Text("Nama Ruangan"),
                border: OutlineInputBorder(),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(60.0, 40.0),
                  ),
                  child: const Text("Batal",
                      style: TextStyle(color: Colors.blueGrey)),
                ),
                const SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snack bar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      log("Room name: ${_buildingNameController.text}");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(60.0, 40.0),
                  ),
                  child: const Text("Perbarui"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    _buildingNameController.text = controller.roomData!.name;
    super.initState();
  }
}

/*
  TODO: add more field
  TODO: update new data to API
  TODO: move text editing controller to controller
 */

// https://stackoverflow.com/questions/69862806/flutter-getx-pass-data-to-another-page
// https://stackoverflow.com/questions/57904993/get-data-from-json-and-put-them-in-textfields