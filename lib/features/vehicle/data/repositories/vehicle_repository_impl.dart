import 'package:appmotors/core/error/exceptions.dart';
import 'package:appmotors/features/vehicle/data/datasources/vehicle_remote_data_source.dart';
import 'package:appmotors/features/vehicle/domain/entities/vehicle.dart';
import 'package:appmotors/core/error/failures.dart';
import 'package:appmotors/features/vehicle/domain/repositories/vehicle_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class VehicleRepositoryImpl implements VehicleRepository {
  final VehicleRemoteDataSource vehicleRemoteDataSource;
  final InternetConnectionChecker internetConnectionChecker;

  const VehicleRepositoryImpl({
    required this.vehicleRemoteDataSource,
    required this.internetConnectionChecker,
  });

  @override
  Future<Either<Failure, List<Vehicle>>> getVehicles({
    required int page,
  }) async {
    if (await internetConnectionChecker.hasConnection) {
      try {
        final vehicles = await vehicleRemoteDataSource.getVehicles(
          page: page,
        );

        return Right(vehicles);
      } on ServerException {
        return Left(
          ServerFailure(),
        );
      } on DartException {
        return Left(
          DartFailure(),
        );
      }
    } else {
      return Left(
        NoConnectionFailure(),
      );
    }
  }
}
