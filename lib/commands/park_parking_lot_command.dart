import 'package:parking_lot/commands/command_executor.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/models/car_model.dart';
import 'package:parking_lot/services/parking_lot_service.dart';

class ParkParkingLotCommand implements CommandExecutor<String, String> {
  final ParkingLotService parkingLotRepository;

  ParkParkingLotCommand({this.parkingLotRepository});

  @override
  String execute(String input) {
    var registrationNumber = input.split(ParkingLotConstant.emptySpace)[1];
    var car = Car(registrationNumber: registrationNumber);
    final result = parkingLotRepository.parkVehicle(car);
    print(result);
    return result;
  }
}
