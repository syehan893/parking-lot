import 'package:flutter_test/flutter_test.dart';
void main() {
  group('leave response model test', () {
    test('should have registrationNumber, parkingCharge and slotNumber', () {
      var registrationNumber = 'KA-1234-SS-04';
      var parkingCharge = 5;
      var props = [registrationNumber, parkingCharge];
      final vehicle = LeaveRequest(
          registrationNumber: registrationNumber, parkingCharge: parkingCharge);
      expect(vehicle.props, props);
    });
  });
}
