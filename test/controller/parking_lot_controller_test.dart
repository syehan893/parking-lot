import 'package:mockito/mockito.dart';
import 'package:parking_lot/commands/create_parking_lot_command.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/controller/parking_lot_controller.dart';
import 'package:parking_lot/services/parking_lot_service.dart';
import 'package:sprintf/sprintf.dart';
import 'package:test/test.dart';

class MockParkingLotService extends Mock implements ParkingLotService {}

void main() {
  group('parking lot controller test', () {
    CreateParkingLotCommand createParkingLotCommand;
    MockParkingLotService mockParkingLotService;
    ParkingLotController parkingLotController;
    setUpAll(() {
      mockParkingLotService = MockParkingLotService();
      createParkingLotCommand =
          CreateParkingLotCommand(parkingLotRepository: mockParkingLotService);
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
  });
}
