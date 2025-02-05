import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rumbuk_web/presentation/reservation/addon/components/custom_chip2.widget.dart';
import 'package:rumbuk_web/presentation/reservation/addon/reservation.controller.dart';

class ReservationOrder extends StatefulWidget {
  const ReservationOrder(
      {super.key,
      required this.indexB,
      required this.indexF,
      required this.indexR});

  final int indexB;
  final int indexF;
  final int indexR;

  @override
  State<ReservationOrder> createState() => _ReservationOrderState();
}

class _ReservationOrderState extends State<ReservationOrder> {
  final ReservationController2 reservationController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var roomData = reservationController.buildingRoomList[widget.indexB]
        .floors![widget.indexF].rooms![widget.indexR];
    var floorData = reservationController
        .buildingRoomList[widget.indexB].floors![widget.indexF];
    var buildingData = reservationController.buildingRoomList[widget.indexB];
    var roomTimeSlot = reservationController.buildingRoomList[widget.indexB]
        .floors![widget.indexF].rooms![widget.indexR].timeSlot;

    final dateFormatter = DateFormat('E, d MMMM yyyy', 'id_ID');
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ruang', style: Theme.of(context).textTheme.titleMedium),
                  Text(
                      '${roomData.name}\n${buildingData.name}, ${floorData.name}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.end),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Gedung, Lantai',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('${buildingData.name}, ${floorData.name}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.end),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Kapasitas',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('${roomData.capacity}',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Tanggal Reservasi',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text(dateFormatter.format(reservationController.selectedDate),
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
              const SizedBox(height: 8),
              Text('Pilih Waktu',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.grey.shade500)),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  direction: Axis.horizontal,
                  spacing: 8,
                  children: List<Widget>.generate(
                    roomTimeSlot!.length,
                    (index) => CustomChoiceChip(
                      label: '${roomTimeSlot[index].startTime}',
                      selected: (reservationController
                                  .selectedRoomTimeIndex.value ==
                              index) &&
                          reservationController.isSelectedRoomTimeButton.value,
                      onSelected: (selected) {
                        if (roomTimeSlot[index].reserved == false) {
                          reservationController.isSelectedRoomTimeButton.value =
                              true;
                          reservationController.selectedRoomTimeIndex.value =
                              (selected
                                  ? index
                                  : reservationController
                                      .selectedRoomTimeIndex.value);
                          reservationController.selectedRTSID.value =
                              roomTimeSlot[index].rtsId!;
                        }

                        // setState(() {
                        //   reservationController.isSelectedRoomTimeButton.value = true;
                        //   reservationController.selectedRoomTimeIndex.value = (selected ? index : null)!;
                        // });
                      },
                      disabled: roomTimeSlot[index].reserved!,
                    ),
                  ).toList(),
                ),
              ),
              const SizedBox(height: 8),
              Text('Kegiatan', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 4),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: reservationController.studentIdFieldController,
                      validator: (value) {
                        return value == null || value.isEmpty
                            ? 'Field tidak boleh kosong'
                            : null;
                      },
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                        hintText: "NPM",
                        label: Text("NPM"),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      validator: (value) => (value == null || value.isEmpty)
                          ? '*mohon isi kegiatan atau aktivitas anda'
                          : null,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: reservationController.activityControllerText,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Kegiatan atau aktivitas'),
                    ),
                  ],
                ),
              ),
              //const Expanded(child: SizedBox()),
              const SizedBox(height: 8),
              FilledButton(
                child: reservationController.reservationLoading.value
                    ? Container(
                        width: 24,
                        height: 24,
                        padding: const EdgeInsets.all(2.0),
                        child: const CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 3),
                      )
                    : Text(
                        'Pinjam ruangan ini',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(fontSize: 18.0, color: Colors.white),
                      ),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    await reservationController.makeReservation(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
