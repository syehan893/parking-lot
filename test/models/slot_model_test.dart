import 'package:flutter_test/flutter_test.dart';
import 'package:parking_lot/models/vehicle_model.dart';

void main() {
  group('slot model test', () {
    var vehicle = Vehicle(color: 'blue', registrationNumber: 'KA-1234-SS-04');
    var slotNumber = 5;
    var actual = Slot(slotNumber: slotNumber, vehicleParked: vehicle);
    test('should have slot number and vehicle', () {
      var props = [vehicle, slotNumber];
      expect(actual.props, props);
    });
  });
}
