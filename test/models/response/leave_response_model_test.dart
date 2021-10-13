import 'package:flutter_test/flutter_test.dart';
import 'package:parking_lot/models/response/leave_response_model.dart';

void main() {
  group('leave response model test', () {
    test('should have registrationNumber, parkingCharge and slotNumber', () {
      var registrationNumber = 'KA-1234-SS-04';
      var slotNumber = 5;
      var parkingCharge = 5;
      var props = [registrationNumber, parkingCharge, slotNumber];
      final vehicle = LeaveResponse(
          registrationNumber: registrationNumber,
          slotNumber: slotNumber,
          parkingCharge: parkingCharge);
      expect(vehicle.props, props);
    });
  });
}
