import 'package:flutter_test/flutter_test.dart';
import 'package:parking_lot/models/car_model.dart';

void main() {
  group('car model test', () {
    test('should have registrationNumber and color', (){
    var registrationNumber = 'PA-1234-CC-04';
    var color = 'red';
    var props = [registrationNumber,color];
    final vehicle = Car(registrationNumber: registrationNumber,color: color);
    expect(vehicle.props, props);
  });
  });
}