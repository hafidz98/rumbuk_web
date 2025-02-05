import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/reservation/addon/reservation.screen.dart';
//import 'package:rumbuk_web/presentation/reservation/controller/reservation_controller.dart';
// import 'package:rumbuk_web/widgets/custom_dropdownmenu2.dart';
// import 'package:rumbuk_web/widgets/sidebars/custom_snackbar.dart';
// import 'package:rumbuk_web/constants/style.dart';
// import 'package:rumbuk_web/widgets/custom_text.dart';

class ReservationNewForm2 extends StatefulWidget {
  const ReservationNewForm2({Key? key}) : super(key: key);

  @override
  State<ReservationNewForm2> createState() => _ReservationNewForm2State();
}

class _ReservationNewForm2State extends State<ReservationNewForm2> {
  // final _controller = Get.put(ReservationController());
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: 550,
      color: Colors.white,
      child: ReservationScreen(),
    );
  }
}
