import 'dart:developer';

import 'package:rumbuk_web/data/network/client/api_client.dart';
import 'package:rumbuk_web/data/network/client/api_dio_client.dart';
import 'package:rumbuk_web/data/network/client/building_service.dart';
import 'package:rumbuk_web/data/network/mapper/network_mapper.dart';
import 'package:rumbuk_web/domain/model/building.dart';

class BuildingRepository {
  //final ApiService apiClient;
  final ApiService apiClient;
  final BuildingEntityMapper networkMapper;

  late BuildingService bs;

  BuildingRepository({required this.apiClient, required this.networkMapper}){
    bs = BuildingService(as: apiClient);
  }

  Future<List<Building>> getBuildings() async {
    final buildings = await bs.getBuildings();
    // final buildings = await apiClient.getBuildings();
    log("data repo: $buildings.data");
    return networkMapper.toBuildings(buildings.data);
  }
}

// TODO: jadi building service di folder domain/repository