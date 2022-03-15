import 'package:appmotors/core/error/failures.dart';
import 'package:appmotors/features/vehicle/domain/usecases/get_vehicles.dart';
import 'package:appmotors/features/vehicle/presentation/cubit/vehicle_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetVehicles extends Mock implements GetVehicles {}

void main() {
  late MockGetVehicles mockGetVehicles;
  late VehicleCubit vehicleCubit;
  const tPage = 1;
  setUp(
    () {
      mockGetVehicles = MockGetVehicles();
      vehicleCubit = VehicleCubit(
        getVehicles: mockGetVehicles,
      );
    },
  );

  group('fetch', () {
    blocTest(
      'emits [] when nothing is called',
      build: () => vehicleCubit,
      expect: () => [],
    );

    blocTest<VehicleCubit, VehicleState>(
      'emits [VehicleLoading, VehicleError] when fetch is called with error',
      setUp: () {
        when(() => mockGetVehicles.call(tPage)).thenAnswer(
          (invocation) async => Left(
            ServerFailure(),
          ),
        );
      },
      build: () => vehicleCubit,
      act: (cubit) => cubit.fetch(page: tPage),
      expect: () => [VehicleLoading(), VehicleError()],
    );

    blocTest<VehicleCubit, VehicleState>(
      'emits [VehicleLoading, VehiclesLoaded] when fetch is called with success',
      setUp: () {
        when(() => mockGetVehicles.call(tPage)).thenAnswer(
          (invocation) async => const Right(
            [],
          ),
        );
      },
      build: () => vehicleCubit,
      act: (cubit) => cubit.fetch(page: tPage),
      expect: () => [VehicleLoading(), const VehiclesLoaded(vehicles: [])],
    );
  });
}
