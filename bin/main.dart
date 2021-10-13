import 'dart:io';

import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/controller/parking_lot_controller.dart';
import 'package:parking_lot/services/impl/parking_lot_service.dart';

void main() {
  var parkingLotController =
      ParkingLotController(parkingLotRepository: ParkingLotServiceImpl());
  while (true) {
    stdout.write(ParkingLotConstant.prefixCommand);
    parkingLotController.parkingLotCommands(stdin.readLineSync());
  }
}
