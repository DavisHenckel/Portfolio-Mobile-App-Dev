import 'package:geolocator/geolocator.dart';
import 'package:wasteagram/exports.dart';

class WasteDataContainer {
  
  int numWasted;
  DateTime date;
  Position position;
  GeoFirePoint geo;
  String imgURL;


  WasteDataContainer({this.numWasted = 0, this.date, this.position, this.geo, this.imgURL = ''});
  
}