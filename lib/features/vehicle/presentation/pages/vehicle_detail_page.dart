import 'package:appmotors/features/vehicle/domain/entities/vehicle.dart';
import 'package:appmotors/features/vehicle/presentation/widgets/vehicle_item.dart';
import 'package:flutter/material.dart';

class VehicleDetailPage extends StatelessWidget {
  final Vehicle vehicle;

  const VehicleDetailPage({
    Key? key,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Veículo',
        ),
      ),
      body: VehicleItem(
        vehicle: vehicle,
        onTap: () {},
      ),
    );
  }
}
