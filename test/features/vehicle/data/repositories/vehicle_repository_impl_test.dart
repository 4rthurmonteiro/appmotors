import 'package:appmotors/core/error/exceptions.dart';
import 'package:appmotors/features/vehicle/data/datasources/vehicle_remote_data_source.dart';
import 'package:appmotors/features/vehicle/data/repositories/vehicle_repository_impl.dart';
import 'package:appmotors/features/vehicle/domain/repositories/vehicle_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockVehicleRemoteDataSource extends Mock
    implements VehicleRemoteDataSource {}

class MockInternetConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late final MockInternetConnectionChecker mockInternetConnectionChecker;
  late final MockVehicleRemoteDataSource mockVehicleRemoteDataSource;
  late final VehicleRepository vehicleRepositoryImpl;
  const tPage = 1;
  setUpAll(
    () {
      mockInternetConnectionChecker = MockInternetConnectionChecker();
      mockVehicleRemoteDataSource = MockVehicleRemoteDataSource();
      vehicleRepositoryImpl = VehicleRepositoryImpl(
        vehicleRemoteDataSource: mockVehicleRemoteDataSource,
        internetConnectionChecker: mockInternetConnectionChecker,
      );
    },
  );

  group(
    'getVehicles',
    () {
      group(
        'has Connection',
        () {
          setUpAll(
            () {
              when(
                (() => mockInternetConnectionChecker.hasConnection),
              ).thenAnswer(
                (invocation) async => true,
              );
            },
          );

          test(
            'should return Right when getVehicles is called with success',
            () async {
              when(
                () => mockVehicleRemoteDataSource.getVehicles(
                  page: tPage,
                ),
              ).thenAnswer(
                (invocation) async => [],
              );

              final result =
                  await vehicleRepositoryImpl.getVehicles(page: tPage);

              expect(
                result.isRight(),
                isTrue,
              );
            },
          );

          test(
            'should return Left when getVehicles is called with ServerException',
            () async {
              when(
                () => mockVehicleRemoteDataSource.getVehicles(
                  page: tPage,
                ),
              ).thenThrow(
                ServerException(),
              );

              final result =
                  await vehicleRepositoryImpl.getVehicles(page: tPage);

              expect(
                result.isLeft(),
                isTrue,
              );
            },
          );

          test(
            'should return Left when getVehicles is called with DartException',
            () async {
              when(
                () => mockVehicleRemoteDataSource.getVehicles(
                  page: tPage,
                ),
              ).thenThrow(
                DartException(),
              );

              final result =
                  await vehicleRepositoryImpl.getVehicles(page: tPage);

              expect(
                result.isLeft(),
                isTrue,
              );
            },
          );
        },
      );

      group(
        'has not Connection',
        () {
          setUpAll(
            () {
              when(
                (() => mockInternetConnectionChecker.hasConnection),
              ).thenAnswer(
                (invocation) async => false,
              );
            },
          );

          test(
            'should return Left when getVehicles is called with no connection',
            () async {
              final result =
                  await vehicleRepositoryImpl.getVehicles(page: tPage);

              expect(
                result.isLeft(),
                isTrue,
              );
            },
          );
        },
      );
    },
  );
}
