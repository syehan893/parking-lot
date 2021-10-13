import 'package:equatable/equatable.dart';

class LeaveRequest extends Equatable {
  final String registrationNumber;
  final int parkingCharge;

  LeaveRequest({this.registrationNumber, this.parkingCharge});

  @override
  List<Object> get props => [registrationNumber, parkingCharge];
}
