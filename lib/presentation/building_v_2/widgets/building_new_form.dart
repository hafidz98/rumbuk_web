import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/building_v_2/controller/building_controller.dart';
import 'package:rumbuk_web/widgets/sidebars/custom_snackbar.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

class BuildingNewForm extends StatefulWidget {
  const BuildingNewForm({Key? key}) : super(key: key);

  @override
  State<BuildingNewForm> createState() => _BuildingNewFormState();
}

class _BuildingNewFormState extends State<BuildingNewForm> {
  final _controller = Get.put(Building2Controller());
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
                text: "Tambah Gedung Baru",
                color: active.withValues(alpha: .7),
                weight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _controller.buildingNameField,
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
                hintText: "Nama gedung",
                label: Text("Nama"),
                border: OutlineInputBorder(),
              ),
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
                      var res = await _controller.newBuilding();
                      if (!res) {
                        if (context.mounted) {
                          CustomSnackBar.of(context)
                              .customSnackBar('Gagal simpan');
                        }
                      }
                      _controller.getBuildingData();
                      _controller.buildingNameField.clear();
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
