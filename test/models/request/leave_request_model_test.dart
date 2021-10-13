import 'package:parking_lot/models/request/leave_request_model.dart';
import 'package:test/test.dart';
void main() {
  group('leave response model test', () {
    test('should have registrationNumber, parkingCharge', () {
      var registrationNumber = 'KA-1234-SS-04';
      var parkingCharge = 5;
      var props = [registrationNumber, parkingCharge];
      final vehicle = LeaveRequest(
          registrationNumber: registrationNumber, parkingCharge: parkingCharge);
      expect(vehicle.props, props);
    });
  });
}
