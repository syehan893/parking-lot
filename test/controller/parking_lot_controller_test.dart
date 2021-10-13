import 'package:mockito/mockito.dart';
import 'package:parking_lot/commands/create_parking_lot_command.dart';
import 'package:parking_lot/commands/leave_parking_lot_command.dart';
import 'package:parking_lot/commands/park_parking_lot_command.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/controller/parking_lot_controller.dart';
import 'package:parking_lot/models/car_model.dart';
import 'package:parking_lot/models/slot_model.dart';
import 'package:parking_lot/services/parking_lot_service.dart';
import 'package:sprintf/sprintf.dart';
import 'package:test/test.dart';

class MockParkingLotService extends Mock implements ParkingLotService {}

void main() {
  group('parking lot controller test', () {
    CreateParkingLotCommand createParkingLotCommand;
    ParkParkingLotCommand parkParkingLotCommand;
    LeaveParkingLotCommand leaveParkingLotCommand;
    MockParkingLotService mockParkingLotService;
    ParkingLotController parkingLotController;
    setUpAll(() {
      mockParkingLotService = MockParkingLotService();
      createParkingLotCommand =
          CreateParkingLotCommand(parkingLotRepository: mockParkingLotService);
      parkParkingLotCommand =
          ParkParkingLotCommand(parkingLotRepository: mockParkingLotService);
      leaveParkingLotCommand =
          LeaveParkingLotCommand(parkingLotRepository: mockParkingLotService);
      parkingLotController =
          ParkingLotController(parkingLotRepository: mockParkingLotService);
    });
    test(
        'should return success message when controller call create parking lot command',
        () {
      var command = 'create_parking_lot 6';
      var expected = sprintf(ParkingLotConstant.createdParkingLot, [6]);
      when(createParkingLotCommand.execute(command))
          .thenAnswer((realInvocation) => expected);
      final actual = parkingLotController.parkingLotCommands(command);
      expect(actual, expected);
    });
    test(
        'should return success message when controller call park parking lot command',
        () {
      var command = 'park KA-1234-SS';
      var expected = sprintf(ParkingLotConstant.parkingSuccess, [1]);
      when(parkParkingLotCommand.execute(command))
          .thenAnswer((realInvocation) => expected);
      final actual = parkingLotController.parkingLotCommands(command);
      expect(actual, expected);
    });
    test(
        'should return success message when controller call leave parking lot command',
        () {
      var command = 'leave KA-1234-SS 4';
      var expected =
          sprintf(ParkingLotConstant.leaveSuccess, ['KA-1234-SS', 1, 4]);
      ;
      when(leaveParkingLotCommand.execute(command))
          .thenAnswer((realInvocation) => expected);
      final actual = parkingLotController.parkingLotCommands(command);
      expect(actual, expected);
    });
    test(
        'should return success message when controller call status parking lot command',
        () {
      var command = 'status';
      var listSlot = [
        Slot(
            slotNumber: 1, vehicleParked: Car(registrationNumber: 'KA-1234-SS'))
      ];
      when(mockParkingLotService.parkingStatus())
          .thenAnswer((realInvocation) => listSlot);
      final actual = parkingLotController.parkingLotCommands(command);
      expect(actual, ParkingLotConstant.commonSuccess);
    });
  });
}
