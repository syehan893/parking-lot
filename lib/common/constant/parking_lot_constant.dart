class ParkingLotConstant {
  static String parkingStatus(int slotNumber, String registrationNumber) =>
      '$slotNumber $registrationNumber';
  static const titleStatus = 'Slot No. Registration No.';
  static const emptyString = '';
  static const emptySpace = ' ';
  static const createdParkingLot = 'Created parking lot with %s slots';
  static const parkingSuccess = 'Allocated slot number: %s';
  static const parkingIsFull = 'Sorry, parking lot is full';
  static const registerNotFound = 'Registration number %s not found';
  static const leaveSuccess =
      'Registration number %s with Slot Number %s is free with Charge %s';
  static const createParkingLot = 'create_parking_lot';
  static const park = 'park';
  static const leave = 'leave';
  static const status = 'status';
  static const commonSuccess = 'Success';
  static const invalidCommand = 'Invalid Command';
  static const noCommentAreSelected = 'NO COMMANDS ARE SELECTED';
  static const prefixCommand = '> ';
}
