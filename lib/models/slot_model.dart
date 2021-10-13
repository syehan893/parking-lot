import 'package:equatable/equatable.dart';
import 'package:parking_lot/models/vehicle_model.dart';

class Slot extends Equatable {
  final Vehicle vehicleParked;
  final int slotNumber;

  Slot({this.vehicleParked, this.slotNumber});


  @override
  List<Object> get props => [vehicleParked, slotNumber];
}
