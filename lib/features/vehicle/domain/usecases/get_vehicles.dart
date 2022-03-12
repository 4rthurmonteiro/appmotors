import 'package:appmotors/core/error/failures.dart';
import 'package:appmotors/core/usecases/usecase.dart';
import 'package:appmotors/features/vehicle/domain/entities/vehicle.dart';
import 'package:appmotors/features/vehicle/domain/repositories/vehicle_repository.dart';
import 'package:dartz/dartz.dart';

class GetVehicles implements UseCase<List<Vehicle>, int> {
  const GetVehicles({
    required this.vehicleRepository,
  });

  final VehicleRepository vehicleRepository;

  @override
  Future<Either<Failure, List<Vehicle>>> call(int page) async =>
      await vehicleRepository.getVehicles(
        page: page,
      );
}
