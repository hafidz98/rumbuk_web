import 'package:flutter/material.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

import 'bar_chart.dart';
import 'revenue_info.dart';

class RevenueSectionSmall extends StatelessWidget {
  const RevenueSectionSmall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(26),
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        border: Border.all(color: lightGrey, width: .5),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomText(
                  text: "Revenue Chart",
                  size: 20,
                  weight: FontWeight.bold,
                  color: lightGrey,
                ),
                SizedBox(
                  width: 600,
                  height: 200,
                  child: SimpleBarChart.withSampleData(),
                )
              ],
            ),
          ),
          Container(
            width: 160,
            height: 1,
            color: lightGrey,
          ),
          const SizedBox(
            height: 260,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    RevenueInfo(
                      tittle: "Today's revenue",
                      amount: "23",
                    ),
                    RevenueInfo(
                      tittle: "last 7 days",
                      amount: "184",
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    RevenueInfo(
                      tittle: "Last 30 days",
                      amount: "1255",
                    ),
                    RevenueInfo(
                      tittle: "last 12 months",
                      amount: "3659",
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
