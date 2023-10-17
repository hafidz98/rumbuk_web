import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../constants/style.dart';
import '../../../widgets/custom_text.dart';

class FormFieldTable extends StatefulWidget {
  const FormFieldTable({Key? key}) : super(key: key);

  @override
  State<FormFieldTable> createState() => _FormFieldTableState();
}

class _FormFieldTableState extends State<FormFieldTable> {
  final _formKey = GlobalKey<FormState>();
  final _buildingNameController = TextEditingController();

  String? Function(String?)? get validator => (value) {
    if (value == null || value.isEmpty) {
      return 'Tolong masukkan nama gedung';
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
                text: "Tambah Gedung",
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
                hintText: "Masukkan nama gedung",
                label: Text("Nama Gedung"),
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
                      log("Building name: ${_buildingNameController.text}");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(60.0, 40.0),
                  ),
                  child: const Text("Tambah"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
