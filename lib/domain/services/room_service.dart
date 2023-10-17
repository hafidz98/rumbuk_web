import 'dart:developer';

import 'package:logger/logger.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/data/network/entity/room_entity.dart';

import '../../data/network/mapper/room_entity_mapper.dart';
import '../../data/repository/room_repository.dart';
import '../model/room.dart';

class RoomService{
  final _logger = Logger();
  late final RoomRepository _roomRepository = RoomRepository();
  late final RoomEntityMapper _roomEntityMapper = RoomEntityMapper(log: _logger);

  Future<List<Room>> getRoomList() async {
    final roomList = await _roomRepository.getAllRoom();



    List<RoomEntity> d = roomList.data!.map((e) => RoomEntity.fromJson(e as Map<String, dynamic>)).toList();

    log("[Room Data][Repo]: $d");

    return _roomEntityMapper.toRoomList(d);
  }
}