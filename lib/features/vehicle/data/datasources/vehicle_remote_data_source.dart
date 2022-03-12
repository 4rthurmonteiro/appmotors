import 'package:appmotors/core/error/exceptions.dart';
import 'package:appmotors/features/vehicle/data/models/vehicle_model.dart';
import 'package:dio/dio.dart';

abstract class VehicleRemoteDataSource {
  Future<List<VehicleModel>> getVehicles({
    required int page,
  });
}

class VehicleRemoteDataSourceImpl implements VehicleRemoteDataSource {
  final Dio httpClient;

  VehicleRemoteDataSourceImpl({
    required this.httpClient,
  });

  @override
  Future<List<VehicleModel>> getVehicles({
    required int page,
  }) async {
    try {
      final response = await httpClient.get(
        'https://desafioonline.webmotors.com.br/api/OnlineChallenge/Vehicles?Page=$page',
      );

      final data = response.data as List<dynamic>;
      return data
          .map<VehicleModel>(
            (map) => VehicleModel.fromJson(
              map as Map<String, dynamic>,
            ),
          )
          .toList();
    } on DioError catch (_) {
      throw ServerException();
    } catch (e) {
      throw DartException();
    }
  }
}
