import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/models/request/leave_request_model.dart';
import 'package:parking_lot/models/vehicle_model.dart';
import 'package:parking_lot/services/parking_lot_service.dart';
import 'package:parking_lot/models/parking_lot_model.dart';
import 'package:parking_lot/models/slot_model.dart';
import 'package:sprintf/sprintf.dart';

class ParkingLotServiceImpl implements ParkingLotService {
  ParkingLot parkingLot = ParkingLot();

  @override
  String createParkingLot(int capacity) {
    parkingLot = parkingLot.copywith(
        capacity: capacity,
        slots: List.generate(capacity,
            (index) => Slot(slotNumber: index + 1, vehicleParked: null)));
    return sprintf(ParkingLotConstant.createdParkingLot, [parkingLot.capacity]);
  }

  @override
  String parkVehicle(Vehicle vehicle) {
    for (var item in parkingLot.slots) {
      if (item.vehicleParked == null) {
        var slot = Slot(slotNumber: item.slotNumber, vehicleParked: vehicle);
        parkingLot.slots
            .removeWhere((element) => element.slotNumber == slot.slotNumber);
        parkingLot = parkingLot.copywith(slots: [...parkingLot.slots, slot]);
        parkingLot.slots.sort((a, b) => a.slotNumber.compareTo(b.slotNumber));
        return sprintf(ParkingLotConstant.parkingSuccess, [slot.slotNumber]);
      }
    }
    return ParkingLotConstant.parkingIsFull;
  }

  @override
  String leaveVehicle(LeaveRequest leaveRequest) {
    for (var item in parkingLot.slots) {
      if (item.vehicleParked != null) {
        if (item.vehicleParked.registrationNumber ==
            leaveRequest.registrationNumber) {
          var slot = Slot(slotNumber: item.slotNumber, vehicleParked: null);
          parkingLot.slots
              .removeWhere((element) => element.slotNumber == item.slotNumber);
          parkingLot = parkingLot.copywith(slots: [...parkingLot.slots, slot]);
          return sprintf(ParkingLotConstant.leaveSuccess, [
            leaveRequest.registrationNumber,
            slot.slotNumber,
            leaveRequest.parkingCharge
          ]);
        }
      }
    }
    return sprintf(
        ParkingLotConstant.registerNotFound, [leaveRequest.registrationNumber]);
  }
}
