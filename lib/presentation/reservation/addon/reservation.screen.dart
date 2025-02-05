import 'package:flutter/material.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/reservation/addon/components/custom_chip2.widget.dart';
import 'package:rumbuk_web/presentation/reservation/addon/reservation.controller.dart';
import 'package:rumbuk_web/presentation/reservation/addon/reservation.order.screen.dart';
import 'package:rumbuk_web/presentation/reservation/controller/reservation_controller.dart';

class ReservationScreen extends StatelessWidget {
  ReservationScreen({super.key});
  final ReservationController reservationController = Get.put(ReservationController());
  final ReservationController2 reservationController2 =
      Get.put(ReservationController2());

  @override
  Widget build(BuildContext context) {
    reservationController2.refresh();
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomDatePicker(),
                  const SizedBox(height: 8),
                  BuildingChipButton(),
                ],
              ),
            ),
            const Divider(height: 0),
            Expanded(
              child: Obx(
                () {
                  var itemFloors = reservationController2
                      .buildingRoomList[
                          reservationController2.selectedChipButton.value]
                      .floors;
                  return ListView.builder(
                    primary: false,
                    itemCount: itemFloors?.length ?? 0,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    itemBuilder: (context, index) {
                      return RoomContentCard(
                        indexB: reservationController2.selectedChipButton.value,
                        indexF: index,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoomContentCard extends StatelessWidget {
  RoomContentCard({super.key, required this.indexF, required this.indexB});

  final ReservationController2 _reservationController2 = Get.find();
  final ReservationController _reservationController = Get.find();

  final int indexB;
  final int indexF;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text(
            _reservationController2
                .buildingRoomList[indexB].floors![indexF].name!,
            style: Theme.of(context).textTheme.titleMedium)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.grey.shade500)),
            child: Obx(
              () => Wrap(
                alignment: WrapAlignment.start,
                spacing: 8,
                runSpacing: 4,
                direction: Axis.horizontal,
                children: List.generate(
                  _reservationController2
                      .buildingRoomList[indexB].floors![indexF].rooms!.length,
                  (index) => OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        visualDensity: VisualDensity.compact,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onPressed: () async {
                      await showModalBottomSheet<void>(
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        constraints: const BoxConstraints(
                          maxWidth: 400
                        ),
                        anchorPoint: Offset.zero,
                        useSafeArea: true,
                        shape: const LinearBorder(),
                        context: context,
                        builder: (context) {
                          return Expanded(
                            child: ReservationOrder(
                              indexB: indexB,
                              indexF: indexF,
                              indexR: index,
                            ),
                          );
                        },
                      ).whenComplete(
                        () {
                          _reservationController2.isSelectedRoomTimeButton =
                              false.obs;
                          _reservationController.refresh();
                        },
                      );
                      //     .whenComplete((){
                      //   if (!_reservationController.reservationLoading.value) {
                      //     return ScaffoldMessenger.of(context).showSnackBar(
                      //         const SnackBar(
                      //             behavior: SnackBarBehavior.floating,
                      //             content: Text('Reservasi sukses')));
                      //   }
                      // });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          _reservationController2.buildingRoomList[indexB]
                              .floors![indexF].rooms![index].name!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton(
      {super.key, required this.onPressed, required this.label});

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton(
            onPressed: onPressed,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.zero)),
            elevation: 0,
            child: Text(label)),
      ),
    );
  }
}

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  final ReservationController2 reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return EasyInfiniteDateTimeLine(
      controller: reservationController.eIDTController,
      showTimelineHeader: false,
      disabledDates: List.generate(
          4,
          (index) =>
              reservationController.appsFirstDate.add(Duration(days: index))),
      onDateChange: (selectedDate) {
        setState(() {
          reservationController.focusDate = selectedDate;
          reservationController.selectedDate = selectedDate;
          reservationController.getAvailRoomData();
          debugPrint(selectedDate.toString());
        });
      },
      timeLineProps: const EasyTimeLineProps(hPadding: 16),
      activeColor: Theme.of(context).colorScheme.secondary,
      dayProps: const EasyDayProps(
        height: 56.0,
        width: 56.0,
        dayStructure: DayStructure.dayStrDayNum,
        inactiveDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            fontSize: 18.0,
          ),
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      firstDate: reservationController.appsFirstDate,
      focusDate: reservationController.focusDate,
      lastDate: reservationController.appsLastDate,
      locale: 'id_ID',
    );
  }
}

class BuildingChipButton extends StatelessWidget {
  BuildingChipButton({super.key});
  final ReservationController2 reservationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 8,
          children: List<Widget>.generate(
            reservationController.buildingRoomList.length,
            (index) => CustomChoiceChip(
              label: reservationController.buildingRoomList[index].name!,
              selected: reservationController.selectedChipButton.value == index,
              onSelected: (selected) async {
                reservationController.selectedChipButton.value = selected
                    ? index
                    : reservationController.selectedChipButton.value;
              },
            ),
          ).toList(),
        ),
      ),
    );
  }
}
