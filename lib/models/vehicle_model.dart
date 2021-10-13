import 'package:equatable/equatable.dart';

class Vehicle extends Equatable {
  final String registrationNumber;
  final String color;

  Vehicle({this.registrationNumber, this.color});

  @override
  List<Object> get props => [registrationNumber,color];
}
