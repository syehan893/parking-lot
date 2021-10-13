# parking_lot

This is codebase for parking lot.

## Getting Started

### How to run parking lot

in project root run :
```bash
dart bin/main.dart
```
### How to run test
A single test file can be run just using ```dart test path/to/test.dart``` (as of Dart 2.10 - prior sdk versions must use ```pub run test``` instead of ```dart test```.
Many tests can be run at a time using ```dart test path/to/dir```.

### Command in parking lot

```bash
create_parking_lot 6
```
```create_parking_lot``` create a parking lot area with ```6``` slot

```bash
park KA-1234-SS
```
```park``` a vehicle in parking lot with registration number  ```KA-1234-SS```

```bash
leave KA-1234-SS 4
```
```leave``` a vehicle from parking lot with registration number  ```KA-1234-SS``` and parking time ```4``` hour.

```bash
status
```
will show a ```status``` from parking lot.

### Code structuring
- **bin**
   - ```main.dart``` 
- **lib**
  - **commands** Define specific command
  - **common**
     - **constant** Literal string
  - **controller** 
  - **models** Model in parking lot
     - **request** Model for request
     - **response** Model for response
  - **services** Service in the parking lot
    - **impl** implementation from service
