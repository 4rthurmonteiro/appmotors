import 'package:appmotors/features/vehicle/data/datasources/vehicle_remote_data_source.dart';
import 'package:appmotors/features/vehicle/data/models/vehicle_model.dart';

class FakeVehicleRemoteDataSourceImpl implements VehicleRemoteDataSource {
  @override
  Future<List<VehicleModel>> getVehicles({
    required int page,
  }) async =>
      await Future.value(
        [
          const VehicleModel(
            id: 1,
            make: 'Honda',
            model: 'Fit',
            version: 'Topadao',
            image:
                'https://images.noticiasautomotivas.com.br/img/f/honda-fit-2018-NA-2.jpg',
            km: 40000,
            price: '65.000,00',
            yearModel: 2016,
            yearFabrication: 2016,
            color: 'Cinza',
          ),
          const VehicleModel(
            id: 2,
            make: 'Renault',
            model: 'Sandero',
            version: 'Topadao',
            image:
                'https://www.dezeroacem.com.br/wordpress/wp-content/uploads/blogger/-p5IvtpoXRUY/T9IVIXkpiEI/AAAAAAAAHoE/1T6ys030os0/s1600/Renault%2BSandero.jpg',
            km: 40000,
            price: '65.000,00',
            yearModel: 2016,
            yearFabrication: 2016,
            color: 'Azul',
          ),
        ],
      );
}
