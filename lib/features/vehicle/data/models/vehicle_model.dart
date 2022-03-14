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
    required int km,
    required String price,
    required int yearModel,
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
  ) {
    // Precisei colocar esse workaround pq a API tá http e só funciona https
    final uri1 = Uri.parse(json['Image']);

    final uri2 = uri1.replace(scheme: 'https', fragment: 'uris');

    json['Image'] = uri2.toString();

    return _$VehicleModelFromJson(
      json,
    );
  }
}
