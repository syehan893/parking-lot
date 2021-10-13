import 'package:flutter_test/flutter_test.dart';
import 'package:parking_lot/common/constant/parking_lot_constant.dart';
import 'package:parking_lot/services/impl/parking_lot_service.dart';
import 'package:parking_lot/services/parking_lot_service.dart';
import 'package:sprintf/sprintf.dart';

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
}
