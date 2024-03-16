import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownButton2 extends StatelessWidget {
  const CustomDropdownButton2(
      {required this.hint,
      this.value,
      required this.dropdownItems,
      required this.onChanged,
      super.key});

  final Widget? hint;
  final dynamic value;
  final List<DropdownMenuItem> dropdownItems;
  final ValueChanged? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButtonFormField2(
        hint: hint,
        items: dropdownItems,
        onChanged: onChanged,
        value: value,
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
        ),
      ),
    );
  }
}
