import 'package:flutter_test/flutter_test.dart';
import 'package:parking_lot/models/vehicle_model.dart';

void main() {
  group('vehicle model test', () {
    test('should have registrationNumber and color', () {
      var registrationNumber = 'KA-1234-SS-04';
      var color = 'blue';
      var props = [registrationNumber, color];
      final vehicle =
          Vehicle(registrationNumber: registrationNumber, color: color);
      expect(vehicle.props, props);
    });
  });
}
