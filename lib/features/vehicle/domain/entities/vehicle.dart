import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

class Vehicle extends Equatable {
  const Vehicle({
    required this.id,
    required this.make,
    required this.model,
    required this.version,
    required this.image,
    required this.km,
    required this.price,
    required this.yearModel,
    required this.yearFabrication,
    required this.color,
  });

  @JsonKey(name: 'ID')
  final int id;
  @JsonKey(name: 'Make')
  final String make;
  @JsonKey(name: 'Model')
  final String model;
  @JsonKey(name: 'Version')
  final String version;
  @JsonKey(name: 'Image')
  final String image;
  @JsonKey(name: 'KM')
  final String km;
  @JsonKey(name: 'Price')
  final String price;
  @JsonKey(name: 'YearModel')
  final String yearModel;
  @JsonKey(name: 'YearFab')
  final int yearFabrication;
  @JsonKey(name: 'Color')
  final String color;

  @override
  List<Object?> get props => [
        id,
      ];
}
