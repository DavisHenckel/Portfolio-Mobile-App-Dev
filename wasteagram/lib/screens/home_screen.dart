import 'package:wasteagram/exports.dart';

class HomeScreen extends StatefulWidget {

  static const cameraRoute = 'camera';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TitleText('Wasteagram')
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BigFAB(HomeScreen.cameraRoute),       
    );
  }
}