import 'package:parking_lot/commands/command_executor.dart';
import 'package:parking_lot/services/parking_lot_service.dart';

class ParkParkingLotCommand implements CommandExecutor<String, String> {
  final ParkingLotService parkingLotRepository;

  ParkParkingLotCommand({this.parkingLotRepository});

  @override
  String execute(String input) {
    return input;
  }
}
