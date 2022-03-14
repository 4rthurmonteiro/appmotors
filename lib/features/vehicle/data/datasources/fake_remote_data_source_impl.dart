import 'package:appmotors/features/vehicle/data/datasources/vehicle_remote_data_source.dart';
import 'package:appmotors/features/vehicle/data/models/vehicle_model.dart';

class FakeVehicleRemoteDataSourceImpl implements VehicleRemoteDataSource {
  @override
  Future<List<VehicleModel>> getVehicles({
    required int page,
  }) async =>
      await Future.value(
        [],
      );
}
