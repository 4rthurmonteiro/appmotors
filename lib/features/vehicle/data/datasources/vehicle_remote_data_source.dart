import 'package:appmotors/features/vehicle/data/models/vehicle_model.dart';

abstract class VehicleRemoteDataSource {
  Future<List<VehicleModel>> getVehicles({
    required int page,
  });
}
