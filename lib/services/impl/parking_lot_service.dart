import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/services/parking_lot_service.dart';
import 'package:parking_lot/models/parking_lot_model.dart';
import 'package:sprintf/sprintf.dart';

class ParkingLotServiceImpl implements ParkingLotService {
  ParkingLot parkingLot = ParkingLot();

  @override
  String createParkingLot(int capacity) {
    return sprintf(ParkingLotConstant.createdParkingLot, [parkingLot.capacity]);
  }
}
