import 'package:parking_lot/commands/command_executor.dart';
import 'package:parking_lot/commands/create_parking_lot_command.dart';
import 'package:parking_lot/commands/leave_parking_lot_command.dart';
import 'package:parking_lot/commands/park_parking_lot_command.dart';
import 'package:parking_lot/commands/status_parking_lot_command.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/services/parking_lot_service.dart';

class ParkingLotController {
  final ParkingLotService parkingLotRepository;

  ParkingLotController({this.parkingLotRepository});

  String parkingLotCommands(String command) {
    var commandParkingLot = command.split(ParkingLotConstant.emptySpace)[0];

    var createParkingLotCommand =
        CreateParkingLotCommand(parkingLotRepository: parkingLotRepository);
    var parkParkingLotCommand =
        ParkParkingLotCommand(parkingLotRepository: parkingLotRepository);
    var leaveParkingLotCommand =
        LeaveParkingLotCommand(parkingLotRepository: parkingLotRepository);
    var statusParkingLotCommand =
        StatusParkingLotCommand(parkingLotRepository: parkingLotRepository);

    switch (commandParkingLot) {
      case ParkingLotConstant.createParkingLot:
        final result = createParkingLotCommand.execute(command);
        return result;
        break;
      case ParkingLotConstant.park:
        final result = parkParkingLotCommand.execute(command);
        return result;
        break;
      case ParkingLotConstant.leave:
        final result = leaveParkingLotCommand.execute(command);
        return result;
        break;
      case ParkingLotConstant.status:
        statusParkingLotCommand.execute(NoParam());
        return ParkingLotConstant.commonSuccess;
        break;
      default:
        print(ParkingLotConstant.invalidCommand);
        return ParkingLotConstant.noCommentAreSelected;
        break;
    }
  }
}
