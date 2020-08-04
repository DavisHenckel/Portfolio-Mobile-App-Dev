import 'exports.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/' : (context) => WasteagramHome(title: 'Wasteagram',),
        'camera' : (context) => CameraScreen()
      }
    );
  }
}

class WasteagramHome extends StatefulWidget {
  WasteagramHome({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _WasteagramHomeState createState() => _WasteagramHomeState();
}

class _WasteagramHomeState extends State<WasteagramHome> {
  
  static const cameraRoute = 'camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TitleText(widget.title)
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(cameraRoute);
        },
        tooltip: 'Increment',
        child: Icon(Icons.camera_alt),
      ), 
    );
  }
}
