import 'dart:developer';

import 'package:rumbuk_web/data/network/client/api_client.dart';
import 'package:rumbuk_web/data/network/network_mapper.dart';
import 'package:rumbuk_web/domain/model/building.dart';

class BuildingRepository {
  final ApiClient apiClient;
  final NetworkMapper networkMapper;

  BuildingRepository({required this.apiClient, required this.networkMapper});

  Future<List<Building>> getBuildings() async {
    final buildings = await apiClient.getBuildings();
    log("data repo: $buildings.data");
    return networkMapper.toBuildings(buildings.data);
  }
}