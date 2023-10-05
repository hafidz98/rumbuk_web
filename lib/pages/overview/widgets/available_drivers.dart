import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:rumbuk_web/constants/style.dart';
import 'package:rumbuk_web/widgets/custom_text.dart';
//
// /// Example without a datasource
// class AvailableDrivers extends StatelessWidget {
//   const AvailableDrivers({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 30),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//               offset: const Offset(0, 6),
//               color: lightGrey.withOpacity(.1),
//               blurRadius: 12)
//         ],
//         border: Border.all(color: active.withOpacity(.4), width: .5),
//       ),
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Row(
//             children: [
//               const SizedBox(
//                 width: 10,
//               ),
//               CustomText(
//                 text: "Available Drivers",
//                 color: lightGrey,
//                 weight: FontWeight.bold,
//               )
//             ],
//           ),
//           SizedBox(
//             height: (56 * 7) + 40,
//             child: DataTable2(
//               columnSpacing: 12,
//               dataRowHeight: 56,
//               headingRowHeight: 40,
//               horizontalMargin: 12,
//               minWidth: 600,
//               columns: const [
//                 DataColumn2(
//                   label: Text('Name'),
//                   size: ColumnSize.L,
//                 ),
//                 DataColumn(
//                   label: Text('Location'),
//                 ),
//                 DataColumn(
//                   label: Text('Rating'),
//                 ),
//                 DataColumn(
//                   label: Text('Action'),
//                 ),
//               ],
//               rows: List<DataRow>.generate(
//                 7,
//                 (index) => DataRow(
//                   cells: [
//                     DataCell(CustomText(text: "Reyandra Arsenal")),
//                     DataCell(CustomText(text: "Parangtritis")),
//                     DataCell(CustomText(text: "Parangtritis")),
//                     DataCell(CustomText(text: "Parangtritis")),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// TODO : benerin inih datatable kok error jir

/// Example without datasource
class AvailableDriversTable extends StatelessWidget {
  final List<DataColumn> dataColumn;
  final List<DataRow> dataRow;
  const AvailableDriversTable({super.key, required this.dataColumn, required this.dataRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Available Drivers",
            color: lightGrey,
            weight: FontWeight.bold,
          ),
          SizedBox(
            height: (56 * 7) + 40,
            child: DataTable2(
              columnSpacing: 16,
              columns: dataColumn,
              rows: dataRow,
            ),
          ),
        ],
      ),
    );
  }
}
