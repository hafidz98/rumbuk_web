import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';

class AvailableDriversTable extends StatelessWidget {
  final List<DataColumn> dataColumn;
  final List<DataRow> dataRow;
  const AvailableDriversTable({super.key, required this.dataColumn, required this.dataRow});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: lightGrey, width: .5),
            boxShadow: [BoxShadow(offset: const Offset(0, 4),
                color: lightGrey.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 8)],
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
            height: (56 * 7) + 40,
            child: DataTable2(
              fixedTopRows: 1,
              columnSpacing: 6,
              dataRowHeight: 56,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 600,
              columns: dataColumn,
              rows: dataRow,
            ),
          ),
        ),
      ],
    );
  }
}
