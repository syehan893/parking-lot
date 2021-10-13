import 'package:parking_lot/commands/command_executor.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/services/parking_lot_service.dart';

class CreateParkingLotCommand implements CommandExecutor<String, String> {
  final ParkingLotService parkingLotRepository;

  CreateParkingLotCommand({this.parkingLotRepository});

  @override
  String execute(String input) {
    var argument = input.split(ParkingLotConstant.emptySpace)[1];
    var capacity = int.parse(argument);
    final result = parkingLotRepository.createParkingLot(capacity);
    print(result);
    return result;
  }
}
