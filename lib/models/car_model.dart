
import 'package:parking_lot/models/vehicle_model.dart';

class Car extends Vehicle {
  Car({
    String registrationNumber,
    String color,
  }) : super(
          registrationNumber: registrationNumber,
          color: color,
        );
}
