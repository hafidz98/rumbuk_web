import 'package:get/get.dart';
import 'package:rumbuk_web/presentation/timeslot/model/timeslot.dart';
import 'package:rumbuk_web/presentation/timeslot/service/timeslot_service.dart';

class RoomTimeslotController extends GetxController{
  //Set<ExerciseFilter> filters = <ExerciseFilter>{};

  final _timeSlotService = TimeSlotService();
  late RxList<TimeSlot> timeSlot = <TimeSlot>[].obs;
  late RxList<TimeSlot> existRoomTimeSlot = <TimeSlot>[].obs;
  late RxList<TimeSlot> newRoomTimeSlot = <TimeSlot>[].obs;

  Future<void> getTimeSlotData() async {
    // const String token = '';
    var fetchTimeSlotData = await _timeSlotService.fetchTimeSlot();

    if (fetchTimeSlotData != null) {
      timeSlot.assignAll(fetchTimeSlotData);
    }
  }



  Future<void> addTimeslot() async {

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getTimeSlotData();
  }
}