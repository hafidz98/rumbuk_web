import 'package:flutter/material.dart';
import 'package:rumbuk_web/pages/overview/widgets/info_card.dart';

class OverviewCardLargeScreen extends StatelessWidget {
  const OverviewCardLargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        InfoCard(
          title: "Rides in progress",
          value: "7",
          onTap: () {},
          topColor: Colors.orange,
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "Packages delivered",
          value: "17",
          onTap: () {},
          topColor: Colors.blueAccent,
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "Cancelled delivery",
          value: "3",
          onTap: () {},
          topColor: Colors.redAccent,
        ),
        SizedBox(
          width: width / 64,
        ),
        InfoCard(
          title: "Scheduled deliveries",
          value: "5",
          onTap: () {},
        ),
      ],
    );
  }
}
