import 'package:parking_lot/models/slot_model.dart';
import 'package:parking_lot/models/vehicle_model.dart';
import 'package:test/test.dart';

void main() {
  group('slot model test', () {
    var vehicle = Vehicle(color: 'blue', registrationNumber: 'KA-1234-SS-04');
    var slotNumber = 5;
    var actual = Slot(slotNumber: slotNumber, vehicleParked: vehicle);
    var expectedCopyWith = Slot(slotNumber: 10, vehicleParked: vehicle);
    test('should have slot number and vehicle', () {
      var props = [vehicle, slotNumber];
      expect(actual.props, props);
    });

    test('should return slot copy with', () {
      final actualCopyWith = actual.copywith(slotNumber: 10);
      expect(actualCopyWith, expectedCopyWith);
    });
  });
}
