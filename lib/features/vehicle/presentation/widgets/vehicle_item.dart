import 'package:appmotors/features/vehicle/domain/entities/vehicle.dart';
import 'package:flutter/material.dart';

class VehicleItem extends StatelessWidget {
  final Vehicle vehicle;
  final Function()? onTap;

  const VehicleItem({
    Key? key,
    required this.vehicle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Card(
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Image.network(vehicle.image),
                  Text(
                    'R\$ ${vehicle.price}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      background: Paint()
                        ..strokeWidth = 20.0
                        ..color = Colors.red
                        ..style = PaintingStyle.stroke
                        ..strokeJoin = StrokeJoin.round,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  '${vehicle.make.toUpperCase()} ${vehicle.model.toUpperCase()} ${vehicle.version.toUpperCase()}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.date_range),
                      Text('${vehicle.yearFabrication}/${vehicle.yearModel}'),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     const Icon(Icons.car_rental),
                  //     Text(vehicle.km.toString()),
                  //   ],
                  // ),
                  Text('KMs: ${vehicle.km.toString()}'),

                  Row(
                    children: [
                      const Icon(Icons.color_lens),
                      Text(
                        vehicle.color,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
