import 'package:parking_lot/services/parking_lot_service.dart';

class ParkingLotController {
   final ParkingLotService parkingLotRepository;

  ParkingLotController({this.parkingLotRepository});

  String parkingLotCommands(String command) {
   return command;
  }
}
