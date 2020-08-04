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
        onPressed: () {
          Navigator.of(context).pushNamed(routeName);
        },
        tooltip: 'Access Camera',
        child: Icon(
          Icons.camera_alt,
          size: 40.0
        ),
      ),
    );
  }
}