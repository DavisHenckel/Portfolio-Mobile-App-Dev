import 'package:wasteagram/exports.dart';

class BigFAB extends StatelessWidget {

  final String routeName;

  BigFAB(this.routeName);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      child: FloatingActionButton(
        backgroundColor: Colors.green[600],
        onPressed: () {
          Navigator.of(context).pushNamed(routeName);
        },
        child: Icon(
          Icons.camera_alt,
          size: 40.0
        ),
      ),
    );
  }
}