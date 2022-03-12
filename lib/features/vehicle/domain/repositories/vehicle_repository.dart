import 'package:dartz/dartz.dart';
import 'package:appmotors/core/error/failures.dart';
import 'package:appmotors/features/vehicle/domain/entities/vehicle.dart';

abstract class VehicleRepository {
  Future<Either<Failure, List<Vehicle>>> getVehicles({
    required int page,
  });
}
