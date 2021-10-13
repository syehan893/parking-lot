import 'package:mockito/mockito.dart';
import 'package:parking_lot/commands/park_parking_lot_command.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/models/car_model.dart';
import 'package:parking_lot/services/parking_lot_service.dart';
import 'package:sprintf/sprintf.dart';
import 'package:test/test.dart';

class MockParkingLotRepository extends Mock implements ParkingLotService {}

void main() {
  group('park parking lot command test', () {
    MockParkingLotRepository mockParkingLotRepository;
    ParkParkingLotCommand parkParkingLotCommand;
    setUpAll(() {
      mockParkingLotRepository = MockParkingLotRepository();
      parkParkingLotCommand =
          ParkParkingLotCommand(parkingLotRepository: mockParkingLotRepository);
    });
    test(
        'should return success message when parking lot park command was called',
        () {
      var command = 'park KA-1234-SS';
      var expected = sprintf(ParkingLotConstant.parkingSuccess, [1]);
      when(mockParkingLotRepository.parkVehicle(
              Car(registrationNumber: 'KA-1234-SS')))
          .thenAnswer((realInvocation) => expected);
      final actual = parkParkingLotCommand.execute(command);
      expect(actual, expected);
      expect(actual, isA<String>());
    });
  });
}
