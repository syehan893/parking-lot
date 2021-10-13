import 'package:mockito/mockito.dart';
import 'package:parking_lot/commands/command_executor.dart';
import 'package:parking_lot/commands/status_parking_lot_command.dart';
import 'package:parking_lot/models/car_model.dart';
import 'package:parking_lot/models/slot_model.dart';
import 'package:parking_lot/services/parking_lot_service.dart';
import 'package:test/test.dart';

class MockParkingLotRepository extends Mock implements ParkingLotService {}

void main() {
  group('status parking lot command test', () {
    MockParkingLotRepository mockParkingLotRepository;
    StatusParkingLotCommand statusParkingLotCommand;
    setUpAll(() {
      mockParkingLotRepository = MockParkingLotRepository();
      statusParkingLotCommand = StatusParkingLotCommand(
          parkingLotRepository: mockParkingLotRepository);
    });
    test(
        'should return success message when parking lot status command was called',
        () {
      var car = Car(registrationNumber: 'KA-1234-SS');
      var expected = [Slot(vehicleParked: car, slotNumber: 1)];
      when(mockParkingLotRepository.parkingStatus())
          .thenAnswer((realInvocation) => expected);
      final actual = statusParkingLotCommand.execute(NoParam());
      expect(actual, expected);
      expect(actual, isA<List<Slot>>());
    });
  });
}
