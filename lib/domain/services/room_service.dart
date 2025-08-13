import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:rumbuk_web/constants/strings.dart';
import 'package:rumbuk_web/data/network/client/api_dio_client.dart';
import 'package:rumbuk_web/data/network/entity/room_entity.dart';
import 'package:rumbuk_web/data/network/mapper/room_entity_mapper.dart';
import 'package:rumbuk_web/data/repository/room_repository.dart';
import 'package:rumbuk_web/domain/exception/network_exception.dart';
import 'package:rumbuk_web/domain/model/room.dart';

class RoomService {
  final _logger = Logger();
  late final RoomRepository _roomRepository = RoomRepository();
  late final RoomEntityMapper _roomEntityMapper =
      RoomEntityMapper(log: _logger);

  late ApiDioClient apiDioClient = ApiDioClient();
  String api = '$baseUrl/room';

  Future<List<Room>> getRoomList() async {
    final roomList = await _roomRepository.getAllRoom();

    List<RoomEntity> roomEntityList = roomList.data!
        .map((e) => RoomEntity.fromJson(e as Map<String, dynamic>))
        .toList();

    log("[Room Data][Repo]: ${roomList.data}");

    return _roomEntityMapper.toRoomList(roomEntityList);
  }

  Future changeRoomActiveStatus(Room room) async {
    var data = RoomRequest(
      id: room.id,
      status: room.status,
    );

    try {
      var reqData = data.toRawJson();

      if (kDebugMode) {
        print(reqData);
      }

      var res = await apiDioClient.dio.patch(
        "$api/${data.id}/change_status",
        data: reqData,
      );

      if (res.statusCode != null && res.statusCode! >= 400) {
        throw NetworkExcepton(
          statusCode: res.statusCode!,
          message: res.statusMessage,
        );
      }
    } on DioException catch (e) {
      throw HttpException(e.toString());
    }
  }

  Future createRoom(Room room) async {
    //RoomEntity? myRoomEntity;

    var data = RoomRequest(
        name: room.name,
        capacity: room.capacity,
        building: room.buildingId!,
        floor: room.floorId!);

    try {
      var reqData = data.toRawJson();
      if (kDebugMode) {
        print('request data: $reqData');
      }

      var res = await apiDioClient.dio.post(
        api,
        data: reqData,
      );

      if (res.statusCode != null && res.statusCode! >= 400) {
        throw NetworkExcepton(
          statusCode: res.statusCode!,
          message: res.statusMessage,
        );
      }
      return true;
    } on DioException catch (e) {
      throw HttpException(e.toString());
    }
  }
}

class RoomRequest {
  final int? id;
  final String? name;
  final int? capacity;
  final int? building;
  final int? floor;
  final String? status;

  RoomRequest({
    this.id,
    this.name,
    this.capacity,
    this.building,
    this.floor,
    this.status,
  });

  factory RoomRequest.fromRawJson(String str) =>
      RoomRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RoomRequest.fromJson(Map<String, dynamic> json) => RoomRequest(
        name: json["name"],
        capacity: json["capacity"],
        building: json["building"],
        floor: json["floor"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "capacity": capacity,
        "building": building,
        "floor": floor,
        "status": status,
      };
}
