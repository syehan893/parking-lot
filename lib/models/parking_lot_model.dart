import 'package:equatable/equatable.dart';
import 'package:parking_lot/models/slot_model.dart';

class ParkingLot extends Equatable {
  final List<Slot> slots;
  final int capacity;

  ParkingLot({this.slots, this.capacity});

  ParkingLot copywith({
    List<Slot> slots,
    int capacity,
  }) =>
      ParkingLot(
        slots: slots ?? this.slots,
        capacity: capacity ?? this.capacity,
      );

  @override
  List<Object> get props => [slots, capacity];
}
