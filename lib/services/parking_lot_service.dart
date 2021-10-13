import 'package:parking_lot/models/request/leave_request_model.dart';
import 'package:parking_lot/models/slot_model.dart';
import 'package:parking_lot/models/vehicle_model.dart';

abstract class ParkingLotService {
  String createParkingLot(int capacity);
  String parkVehicle(Vehicle vehicle);
  String leaveVehicle(LeaveRequest leaveRequest);
  List<Slot> parkingStatus();
  int parkingCharge(int parkingTime);
}
