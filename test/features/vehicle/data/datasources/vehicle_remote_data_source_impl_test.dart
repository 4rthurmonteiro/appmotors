import 'package:appmotors/features/vehicle/data/datasources/vehicle_remote_data_source.dart';
import 'package:appmotors/features/vehicle/data/datasources/vehicle_remote_data_source_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late VehicleRemoteDataSource vehicleRemoteDataSourceImpl;
  late MockDio mockDio;

  setUp(
    () {
      mockDio = MockDio();
      vehicleRemoteDataSourceImpl = VehicleRemoteDataSourceImpl(
        httpClient: mockDio,
      );
    },
  );

  group(
    'getVehicles',
    () {
      // test('', body)
    },
  );
}
