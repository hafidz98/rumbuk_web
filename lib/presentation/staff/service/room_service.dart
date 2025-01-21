import 'dart:developer';

import 'package:logger/logger.dart';
import 'package:rumbuk_web/data/network/entity/room_entity.dart';

import 'package:rumbuk_web/data/network/mapper/room_entity_mapper.dart';
import 'package:rumbuk_web/data/repository/room_repository.dart';
import 'package:rumbuk_web/domain/model/room.dart';

class RoomService {
  final _logger = Logger();
  late final RoomRepository _roomRepository = RoomRepository();
  late final RoomEntityMapper _roomEntityMapper =
      RoomEntityMapper(log: _logger);

  Future<List<Room>> getRoomList() async {
    final roomList = await _roomRepository.getAllRoom();

    List<RoomEntity> roomEntityList = roomList.data!
        .map((e) => RoomEntity.fromJson(e as Map<String, dynamic>))
        .toList();

    log("[Room Data][Repo]: $roomEntityList");

    return _roomEntityMapper.toRoomList(roomEntityList);
  }
}
