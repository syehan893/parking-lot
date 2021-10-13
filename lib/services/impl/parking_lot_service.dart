import 'package:parking_lot/common/constant/parking_lot_constant.dart';
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
}
