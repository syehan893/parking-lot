import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/models/vehicle_model.dart';
import 'package:parking_lot/services/impl/parking_lot_service.dart';
import 'package:parking_lot/services/parking_lot_service.dart';
import 'package:sprintf/sprintf.dart';
import 'package:test/test.dart';

void main() {
  group('create parking lot service test', () {
    ParkingLotService parkingLotRepository;
    setUp(() {
      parkingLotRepository = ParkingLotServiceImpl();
    });
    test('should return success message when parking lot created', () {
      var capacity = 6;
      var expected = sprintf(ParkingLotConstant.createdParkingLot, [capacity]);
      final actual = parkingLotRepository.createParkingLot(capacity);
      expect(actual, expected);
      expect(actual, isA<String>());
    });
  });

  group('park vehicle service test', () {
    ParkingLotService parkingLotRepository;
    setUp(() {
      parkingLotRepository = ParkingLotServiceImpl();
    });
    test(
        'should return parking success message when vehicle parked then parked with slot 1',
        () {
      var vehicle = Vehicle(registrationNumber: 'KA-1234-SS', color: 'blue');
      var expected = sprintf(ParkingLotConstant.parkingSuccess, [1]);
      parkingLotRepository.createParkingLot(1);
      final actual = parkingLotRepository.parkVehicle(vehicle);
      expect(actual, expected);
      expect(actual, isA<String>());
    });

    test('should return parking failed message when vehicle parked', () {
      var vehicle = Vehicle(registrationNumber: 'KA-1234-SS', color: 'blue');
      var expected = ParkingLotConstant.parkingIsFull;
      parkingLotRepository.createParkingLot(0);
      final actual = parkingLotRepository.parkVehicle(vehicle);
      expect(actual, expected);
      expect(actual, isA<String>());
    });
  });
}
