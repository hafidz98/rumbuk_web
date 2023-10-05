import 'package:logger/logger.dart';
import 'package:rumbuk_web/data/network/entity/building_entity.dart';
import 'package:rumbuk_web/domain/exception/mapper_exception.dart';
import 'package:rumbuk_web/domain/model/building.dart';

class NetworkMapper {
  final Logger log;

  NetworkMapper({required this.log});

  Building toBuilding(BuildingEntity entity) {
    try {
      return Building(
        id: entity.id.toString(),
        name: entity.name,
      );
    } catch (e) {
      throw MapperException<BuildingEntity, Building>(e.toString());
    }
  }

  List<Building> toBuildings(List<BuildingEntity> entities) {
    final List<Building> buildings = [];

    for(final entity in entities) {
      try {
        buildings.add(toBuilding(entity));
      } catch (e) {
        log.e('Could not map entity ${entity.id}', error: e);
      }
    }
    return buildings;
  }
}
