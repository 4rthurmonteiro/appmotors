// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleModel _$VehicleModelFromJson(Map<String, dynamic> json) => VehicleModel(
      id: json['ID'] as int,
      make: json['Make'] as String,
      model: json['Model'] as String,
      version: json['Version'] as String,
      image: json['Image'] as String,
      km: json['KM'] as int,
      price: json['Price'] as String,
      yearModel: json['YearModel'] as int,
      yearFabrication: json['YearFab'] as int,
      color: json['Color'] as String,
    );

Map<String, dynamic> _$VehicleModelToJson(VehicleModel instance) =>
    <String, dynamic>{
      'ID': instance.id,
      'Make': instance.make,
      'Model': instance.model,
      'Version': instance.version,
      'Image': instance.image,
      'KM': instance.km,
      'Price': instance.price,
      'YearModel': instance.yearModel,
      'YearFab': instance.yearFabrication,
      'Color': instance.color,
    };
