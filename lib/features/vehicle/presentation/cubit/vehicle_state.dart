part of 'vehicle_cubit.dart';

abstract class VehicleState extends Equatable {
  const VehicleState();

  @override
  List<Object> get props => [];
}

class VehicleInitial extends VehicleState {}

class VehicleLoading extends VehicleState {}

class VehiclesLoaded extends VehicleState {
  final List<Vehicle> vehicles;

  const VehiclesLoaded({required this.vehicles});
}

class VehicleError extends VehicleState {}
