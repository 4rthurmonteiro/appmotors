import 'package:appmotors/features/vehicle/data/datasources/fake_remote_data_source_impl.dart';
import 'package:appmotors/features/vehicle/data/datasources/vehicle_remote_data_source.dart';
import 'package:appmotors/features/vehicle/data/datasources/vehicle_remote_data_source_impl.dart';
import 'package:appmotors/features/vehicle/data/repositories/vehicle_repository_impl.dart';
import 'package:appmotors/features/vehicle/domain/repositories/vehicle_repository.dart';
import 'package:appmotors/features/vehicle/domain/usecases/get_vehicles.dart';
import 'package:appmotors/features/vehicle/presentation/cubit/vehicle_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final getIt = GetIt.instance;

void setup({
  bool useFakeDataSource = false,
}) {
  getIt.registerLazySingleton<Dio>(
    () => Dio(),
  );

  getIt.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );

  getIt.registerLazySingleton<VehicleRemoteDataSource>(
    () => useFakeDataSource
        ? FakeVehicleRemoteDataSourceImpl()
        : VehicleRemoteDataSourceImpl(
            httpClient: getIt(),
          ),
  );

  getIt.registerLazySingleton<VehicleRepository>(
    () => VehicleRepositoryImpl(
      vehicleRemoteDataSource: getIt(),
      internetConnectionChecker: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetVehicles>(
    () => GetVehicles(
      vehicleRepository: getIt(),
    ),
  );

  getIt.registerFactory<VehicleCubit>(
    () => VehicleCubit(
      getVehicles: getIt(),
    ),
  );
}
