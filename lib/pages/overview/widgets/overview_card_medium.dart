import 'package:flutter/material.dart';
import 'package:rumbuk_web/pages/overview/widgets/info_card.dart';

class OverviewCardMediumScreen extends StatelessWidget {
  const OverviewCardMediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "Rides in progress",
              value: "7",
              onTap: () {},
              topColor: Colors.orange,
              isActive: true,
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
          ],
        ),
        const SizedBox(height: 16,),
        Row(
          children: [
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
        )
      ],
    );
  }
}
