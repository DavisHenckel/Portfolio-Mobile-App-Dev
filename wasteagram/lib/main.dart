import 'exports.dart';
import 'package:intl/intl.dart';

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
        'camera' : (context) => CameraScreen(),
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
        // 'waste_entry' : (context) => WasteEntry()
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

  String interpretTimestamp(var timestamp) {
    var format = new DateFormat('EEE, M/d/y');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    var time = format.format(date);
    return time;
  }

  static const cameraRoute = 'camera';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TitleText('Wasteagram')
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('waste').snapshots(),
        builder: (content, snapshot) {
          if(!snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                var item = snapshot.data.documents[index];
                var date = interpretTimestamp(item['date'].millisecondsSinceEpoch);
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context,
                      ExtractArgumentsScreen.routeName,
                      arguments: WasteEntry(
                        date, item['location'], item['URL'], item['waste']
                      )
                    );
                  },
                  child: ListTile(
                    title: Text(date),
                    trailing: Text(
                      item['waste'].toString(),
                      style: TextStyle(fontSize: 20),
                    )
                  ),
                );
              }
            );
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BigFAB(cameraRoute),  
    );
  }
}


//wasteagram-6d3ca