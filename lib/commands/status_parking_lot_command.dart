import 'package:parking_lot/commands/command_executor.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/models/slot_model.dart';
import 'package:parking_lot/services/parking_lot_service.dart';

class StatusParkingLotCommand implements CommandExecutor<List<Slot>, NoParam> {
  final ParkingLotService parkingLotRepository;

  StatusParkingLotCommand({this.parkingLotRepository});

  @override
  List<Slot> execute(NoParam input) {
    return null;
  }
}
