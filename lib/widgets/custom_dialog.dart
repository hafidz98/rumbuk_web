import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {super.key,
      required this.confirmButton,
      required this.title,
      required this.description});
  final String title;
  final String description;
  final VoidCallback confirmButton;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))),
      title: Text(title),
      content: Text(description),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: confirmButton,
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
