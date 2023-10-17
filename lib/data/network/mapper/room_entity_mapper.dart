import 'package:logger/logger.dart';
import 'package:rumbuk_web/data/network/entity/room_entity.dart';
import 'package:rumbuk_web/domain/model/room.dart';

import '../../../domain/exception/mapper_exception.dart';

class RoomEntityMapper {
  final Logger log;

  RoomEntityMapper({required this.log});

  Room toRoom(RoomEntity entity) {
    try {
      return Room(
        id: entity.id,
        name: entity.name,
        capacity: entity.capacity,
      );
    } catch (e) {
      throw MapperException<RoomEntity, Room>(e.toString());
    }
  }

  List<Room> toRoomList(List<RoomEntity> entities) {
    final List<Room> roomList = [];

    for (final entity in entities) {
      try {
        roomList.add(toRoom(entity));
      } catch (e) {
        log.e('Could not map entity ${entity.id}', error: e);
      }
    }
    return roomList;
  }
}
