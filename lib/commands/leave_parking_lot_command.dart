import 'package:parking_lot/commands/command_executor.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/models/request/leave_request_model.dart';
import 'package:parking_lot/services/parking_lot_service.dart';

class LeaveParkingLotCommand implements CommandExecutor<String, String> {
  final ParkingLotService parkingLotRepository;

  LeaveParkingLotCommand({this.parkingLotRepository});

  @override
  String execute(String input) {
    var registrationNumber = input.split(ParkingLotConstant.emptySpace)[1];
    var parkingTime = int.parse(input.split(ParkingLotConstant.emptySpace)[2]);
    final parkingCharge = parkingLotRepository.parkingCharge(parkingTime);
    var leaveRequest = LeaveRequest(
      registrationNumber: registrationNumber,
      parkingCharge: parkingCharge,
    );
    final result = parkingLotRepository.leaveVehicle(leaveRequest);
    print(result);
    return result;
  }
}
