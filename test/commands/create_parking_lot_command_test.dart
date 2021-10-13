import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:parking_lot/commands/create_parking_lot_command.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/services/parking_lot_service.dart';
import 'package:sprintf/sprintf.dart';

class MockParkingLotService extends Mock implements ParkingLotService {}

void main() {
  group('create parking lot command test', () {
    MockParkingLotService mockParkingLotRepository;
    CreateParkingLotCommand createParkingLotCommand;
    setUpAll(() {
      mockParkingLotRepository = MockParkingLotService();
      createParkingLotCommand = CreateParkingLotCommand(
          parkingLotRepository: mockParkingLotRepository);
    });
    test('should return success message when parking lot created command was called', () {
      var command = 'create_parking_lot 6';
      var expected = sprintf(ParkingLotConstant.createdParkingLot, [6]);
      when(mockParkingLotRepository.createParkingLot(6))
          .thenAnswer((realInvocation) => expected);
      final actual = createParkingLotCommand.execute(command);
      expect(actual, expected);
      expect(actual, isA<String>());
    });
  });
}
