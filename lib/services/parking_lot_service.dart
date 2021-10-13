import 'package:parking_lot/models/vehicle_model.dart';

abstract class ParkingLotService {
  String createParkingLot(int capacity);
  String parkVehicle(Vehicle vehicle);
}
