import 'package:wasteagram/exports.dart';

//Referenced flutter.dev Pass arguments to a named route
class ExtractArgumentsScreen extends StatelessWidget {

  static const routeName = 'waste_entry';

  @override
  Widget build(BuildContext context) {
    final WasteEntry args = ModalRoute.of(context).settings.arguments;
    return WasteEntry(args.dateTime, args.geoPoint, args.url, args.numWaste);
  }
}