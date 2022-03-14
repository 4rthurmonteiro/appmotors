import 'dart:convert';

import 'package:appmotors/core/error/exceptions.dart';
import 'package:appmotors/features/vehicle/data/datasources/vehicle_remote_data_source.dart';
import 'package:appmotors/features/vehicle/data/datasources/vehicle_remote_data_source_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late final VehicleRemoteDataSource vehicleRemoteDataSourceImpl;
  late final MockDio mockDio;
  const tPage = 1;
  setUpAll(
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
      final responseData = json.decode(
        fixture(
          'vehicles.json',
        ),
      );
      test(
        'should return a list of vehicles when called with success',
        () async {
          when(() => mockDio.get(
                'https://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?Page=$tPage',
              )).thenAnswer(
            (invocation) async => Response(
              data: responseData,
              requestOptions: RequestOptions(
                path: '',
              ),
            ),
          );

          final result = await vehicleRemoteDataSourceImpl.getVehicles(
            page: tPage,
          );

          expect(
            result.isNotEmpty,
            isTrue,
          );
          expect(
            result.length,
            10,
          );
          expect(
            result.first.id,
            1,
          );
        },
      );

      test(
        'should throw a ServerException when is called with dioError',
        () async {
          when(() => mockDio.get(
                'https://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?Page=$tPage',
              )).thenThrow(
            DioError(
              requestOptions: RequestOptions(
                path: '',
              ),
            ),
          );

          expect(
            () async => await vehicleRemoteDataSourceImpl.getVehicles(
              page: tPage,
            ),
            throwsA(
              isA<ServerException>(),
            ),
          );
        },
      );

      test(
        'should throw a DartException when is called with dart error',
        () async {
          when(() => mockDio.get(
                'https://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?Page=$tPage',
              )).thenThrow(
            NullThrownError(),
          );

          expect(
            () async => await vehicleRemoteDataSourceImpl.getVehicles(
              page: tPage,
            ),
            throwsA(
              isA<DartException>(),
            ),
          );
        },
      );
    },
  );
}
