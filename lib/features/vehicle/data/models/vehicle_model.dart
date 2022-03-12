import 'package:appmotors/features/vehicle/domain/entities/vehicle.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_model.g.dart';

@JsonSerializable()
class VehicleModel extends Vehicle {
  const VehicleModel({
    required int id,
    required String make,
    required String model,
    required String version,
    required String image,
    required String km,
    required String price,
    required String yearModel,
    required int yearFabrication,
    required String color,
  }) : super(
            id: id,
            make: make,
            model: model,
            version: version,
            image: image,
            km: km,
            price: price,
            yearModel: yearModel,
            yearFabrication: yearFabrication,
            color: color);

  factory VehicleModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$VehicleModelFromJson(
        json,
      );
}
