import 'package:appmotors/features/vehicle/domain/entities/vehicle.dart';
import 'package:appmotors/features/vehicle/domain/usecases/get_vehicles.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'vehicle_state.dart';

class VehicleCubit extends Cubit<VehicleState> {
  final GetVehicles getVehicles;
  VehicleCubit({
    required this.getVehicles,
  }) : super(VehicleInitial());

  Future<void> fetch({
    required int page,
  }) async {
    emit(VehicleLoading());
    final failureOrVehicles = await getVehicles(page);

    emit(
      failureOrVehicles.fold(
        (error) => VehicleError(),
        (vehicles) => VehiclesLoaded(
          vehicles: vehicles,
        ),
      ),
    );
  }
}
