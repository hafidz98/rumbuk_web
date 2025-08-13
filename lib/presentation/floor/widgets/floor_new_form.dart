import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/floor/controller/floor_controller.dart';
import 'package:rumbuk_web/widgets/custom_dropdownmenu2.dart';
import 'package:rumbuk_web/widgets/sidebars/custom_snackbar.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

class FloorNewForm extends StatefulWidget {
  const FloorNewForm({Key? key}) : super(key: key);

  @override
  State<FloorNewForm> createState() => _FloorNewFormState();
}

class _FloorNewFormState extends State<FloorNewForm> {
  final _controller = Get.put(FloorController());
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
                text: "Tambah Lantai Baru",
                color: active.withValues(alpha: .7),
                weight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _controller.floorNameField,
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
                hintText: "Nama lantai",
                label: Text("Nama"),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            CustomDropdownButton2(
              hint: const Text("Pilih Gedung"),
              dropdownItems: _controller.getBuildingDropdownMenuItem(),
              onChanged: (value) =>
                  setState(() => _controller.buildingData = value),
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
                      var res = await _controller.newFloor();
                      if (!res) {
                        if (context.mounted) {
                          CustomSnackBar.of(context)
                              .customSnackBar('Gagal simpan');
                        }
                      }
                      _controller.getFloorData();
                      _controller.floorNameField.clear();
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
