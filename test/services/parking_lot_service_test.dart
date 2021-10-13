import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/models/request/leave_request_model.dart';
import 'package:parking_lot/models/slot_model.dart';
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

  group('leave parking lot service test', () {
    ParkingLotService parkingLotRepository;
    setUp(() {
      parkingLotRepository = ParkingLotServiceImpl();
    });
    test(
        'should return success message when leave from parking lot with charge 30',
        () {
      var vehicle = Vehicle(registrationNumber: 'KA-1234-SS', color: 'blue');
      var expected = sprintf(
          ParkingLotConstant.leaveSuccess, [vehicle.registrationNumber, 1, 4]);
      parkingLotRepository.createParkingLot(1);
      parkingLotRepository.parkVehicle(vehicle);
      final actual = parkingLotRepository.leaveVehicle(LeaveRequest(
          registrationNumber: vehicle.registrationNumber, parkingCharge: 4));
      expect(actual, expected);
      expect(actual, isA<String>());
    });

    test('should return failed message when leave from parking lot', () {
      var errorRegistrationNumber = 'KA-1234-SA';
      var vehicle = Vehicle(registrationNumber: 'KA-1234-SS', color: 'blue');
      var expected = sprintf(
          ParkingLotConstant.registerNotFound, [errorRegistrationNumber]);
      parkingLotRepository.createParkingLot(1);
      parkingLotRepository.parkVehicle(vehicle);
      final actual = parkingLotRepository.leaveVehicle(LeaveRequest(
          registrationNumber: errorRegistrationNumber, parkingCharge: 4));
      expect(actual, expected);
      expect(actual, isA<String>());
    });
  });

    group('status parking lot service test', () {
    ParkingLotService parkingLotRepository;
    setUp(() {
      parkingLotRepository = ParkingLotServiceImpl();
    });
    test('should return list slot  when status parking lot called', () {
      var vehicle = Vehicle(registrationNumber: 'KA-1234-SS', color: 'blue');
      var expected = Slot(slotNumber: 1, vehicleParked: vehicle);
      parkingLotRepository.createParkingLot(1);
      parkingLotRepository.parkVehicle(vehicle);
      final actual = parkingLotRepository.parkingStatus();
      expect(actual, [expected]);
      expect(actual, isA<List<Slot>>());
    });
  });
}
