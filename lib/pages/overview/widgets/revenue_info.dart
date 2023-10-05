import 'package:flutter/material.dart';
import 'package:rumbuk_web/constants/style.dart';

class RevenueInfo extends StatelessWidget {
  final String tittle;
  final String amount;

  const RevenueInfo({Key? key, required this.tittle, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: "$tittle \n\n",
              style: TextStyle(color: lightGrey, fontSize: 16)),
          TextSpan(
              text: "\$$amount",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
