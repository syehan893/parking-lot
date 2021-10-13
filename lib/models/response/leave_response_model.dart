import 'package:equatable/equatable.dart';

class LeaveResponse extends Equatable {
  final String registrationNumber;
  final int parkingCharge;
  final int slotNumber;

  LeaveResponse({this.slotNumber, this.registrationNumber, this.parkingCharge});

  @override
  List<Object> get props => [registrationNumber, parkingCharge, slotNumber];
}
