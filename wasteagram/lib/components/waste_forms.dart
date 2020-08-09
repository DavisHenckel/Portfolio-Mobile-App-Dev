import '../exports.dart';

class WasteForm extends StatelessWidget {
  
  final String errorString = 'Waste must be a number';
  final String errorString2 = 'Field cannot be empty';
  final wasteDataContainer;
  
  WasteForm(this.wasteDataContainer);
  
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(
        labelText: 'Waste', border: OutlineInputBorder()),
        onSaved:  (value) {
          wasteDataContainer.numWasted = int.parse(value);
        },
        validator: (value) {
          if (value.isEmpty) {
            return errorString2;
          }
          if (!isNumeric(value)) {
            return errorString;
          }
          else {
            return null;
          }
        },
      ),
  );
  }

}