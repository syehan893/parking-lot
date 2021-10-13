import 'package:mockito/mockito.dart';
import 'package:parking_lot/commands/leave_parking_lot_command.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/models/request/leave_request_model.dart';
import 'package:parking_lot/services/parking_lot_service.dart';
import 'package:sprintf/sprintf.dart';
import 'package:test/test.dart';

class MockParkingLotRepository extends Mock implements ParkingLotService {}

void main() {
  group('leave parking lot command test', () {
    MockParkingLotRepository mockParkingLotRepository;
    LeaveParkingLotCommand leaveParkingLotCommand;
    var registrationNumber = 'KA-1234-SS';
    setUpAll(() {
      mockParkingLotRepository = MockParkingLotRepository();
      leaveParkingLotCommand = LeaveParkingLotCommand(
          parkingLotRepository: mockParkingLotRepository);
    });
    test(
        'should return success message when parking lot leave command was called',
        () {
      var command = 'leave KA-1234-SS 4';
      var expected =
          sprintf(ParkingLotConstant.leaveSuccess, [registrationNumber, 1, 4]);
      when(mockParkingLotRepository.parkingCharge(4))
          .thenAnswer((realInvocation) => 30);
      when(mockParkingLotRepository.leaveVehicle(LeaveRequest(
              registrationNumber: registrationNumber, parkingCharge: 30)))
          .thenAnswer((realInvocation) => expected);
      final actual = leaveParkingLotCommand.execute(command);
      expect(actual, expected);
      expect(actual, isA<String>());
    });
  });
}
