import 'package:flutter_test/flutter_test.dart';
import 'package:parking_lot/models/parking_lot_model.dart';
import 'package:parking_lot/models/slot_model.dart';
import 'package:parking_lot/models/vehicle_model.dart';

void main() {
  group('parking lot model test', () {
    var vehicle = Vehicle(color: 'blue', registrationNumber: 'KA-1234-SS-04');
    var slot = Slot(slotNumber: 4, vehicleParked: vehicle);
    var capacity = 5;
    var actual = ParkingLot(slots: [slot], capacity: capacity);
    var expectedCopyWith = ParkingLot(slots: [slot], capacity: 4);
    test('should have slot and capacity', () {
      var props = [
        [slot],
        capacity
      ];
      expect(actual.props, props);
    });

    test('should return parking lot copy with', () {
      final actualCopyWith = actual.copywith(capacity: 4);
      expect(actualCopyWith, expectedCopyWith);
    });
  });
}
