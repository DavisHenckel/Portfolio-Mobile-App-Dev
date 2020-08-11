import 'package:wasteagram/exports.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:geolocator/geolocator.dart' as geoLoc;

void compareContainer(container1, correctContainer) {
  expect(container1.date, correctContainer.date);
  expect(container1.numWasted, correctContainer.numWasted);
  expect(container1.position, correctContainer.position);
  expect(container1.geo, correctContainer.geo);
  expect(container1.imgURL, correctContainer.imgURL);
}

void compareAttributes(container1, List list) {
  expect(container1.date, list[0]);
  expect(container1.numWasted, list[1]);
  //expect(container1.position, list[3]);
  //expect(container1.geo, list[4]);
  expect(container1.imgURL, list[2]);
}

void testInitializer() {
    test('Testing Waste Container initialization', () {
      var testVar = WasteDataContainer();
      var correctVar = WasteDataContainer();
      correctVar.date = null;
      correctVar.numWasted = 0;
      correctVar.position = null;
      correctVar.geo = null;
      correctVar.imgURL = '';
      compareContainer(testVar, correctVar);
  });
}

void testAssignment() {
  test('Testing Waste Container assignment', () async {
    //Geoflutterfire geo = Geoflutterfire();
    List cmpList = [];
    var testVar = WasteDataContainer();
    cmpList.add(DateTime.now());
    cmpList.add(23);
    //cmpList.add(await geoLoc.Geolocator().getLastKnownPosition(
    //  desiredAccuracy: geoLoc.LocationAccuracy.high));
    //cmpList.add(geo.point(latitude: 32.5, longitude: -62.6));
    cmpList.add('This is a test String!');
    testVar.date = cmpList[0];
    testVar.numWasted = cmpList[1];
    //testVar.position = cmpList[3];
    //testVar.geo = cmpList[4];
    testVar.imgURL = cmpList[2];
    compareAttributes(testVar, cmpList);
  });
}

void main () {
  TestWidgetsFlutterBinding.ensureInitialized();
  testInitializer();
  testAssignment();
}