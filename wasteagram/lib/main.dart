import 'dart:async';
import 'package:flutter_crashlytics/flutter_crashlytics.dart';
import 'exports.dart';
import 'package:intl/intl.dart';


//Main Code taken from https://pub.dev/packages/firebase_crashlytics/example
void main() async {

  bool isInDebugMode = false;

  WidgetsFlutterBinding.ensureInitialized();
  
  FlutterError.onError = (FlutterErrorDetails details) {
    if (isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
      Zone.current.handleUncaughtError(details.exception, details.stack);
    } 
    else {
      Zone.current.handleUncaughtError(details.exception, details.stack);
    }
  };
  runZoned<Future<Null>>(() async {
    runApp(MyApp());
  }, onError: (error, stackTrace) async {
    debugPrint(error.toString());
    await FlutterCrashlytics().reportCrash(error, stackTrace, forceCrash: true);
  });
}

class MyApp extends StatelessWidget {

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
    FirebaseAnalyticsObserver(analytics: analytics);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wasteagram',
      theme: ThemeData.dark(),
      navigatorObservers: [observer],
      initialRoute: '/',
      routes: {  
        '/' : (context) => WasteagramHome(title: 'Wasteagram', analytics: analytics, observer: observer),
        'camera' : (context) => CameraScreen(),
        ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
      },
    );
  }
}

class WasteagramHome extends StatefulWidget {
  WasteagramHome({Key key, this.title, this.analytics, this.observer}) : super(key: key);
  
  final String title;
  final observer;
  final analytics;

  @override
  _WasteagramHomeState createState() => _WasteagramHomeState(analytics, observer);
}

class _WasteagramHomeState extends State<WasteagramHome> {

  _WasteagramHomeState(this.analytics, this.observer);

  final observer;
  final analytics;
  String _message = '';

  String interpretTimestamp(var timestamp) {
    var format = new DateFormat('EEE, M/d/y');
    var date = new DateTime.fromMillisecondsSinceEpoch(timestamp);
    var time = format.format(date);
    return time;
  }

  int totalWaste = 0;
  var db = Firestore.instance.collection('waste');

  static const cameraRoute = 'camera';

  void setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  Future<void> _sendAnalyticsEvent() async {
    await analytics.logEvent(
      name: 'test_event',
      parameters: <String, dynamic>{
        'string': 'string',
        'int': 42,
        'long': 12345678910,
        'double': 42.0,
        'bool': true,
      },
    );
    setMessage('logEvent succeeded');
  }

  Future<void> _testAllEventTypes() async {
    await analytics.logAddPaymentInfo();
    await analytics.logAddToCart(
      currency: 'USD',
      value: 123.0,
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 5,
      price: 24.0,
      origin: 'test origin',
      itemLocationId: 'test location id',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-17',
    );
    await analytics.logAddToWishlist(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 5,
      price: 24.0,
      value: 123.0,
      currency: 'USD',
      itemLocationId: 'test location id',
    );
    await analytics.logAppOpen();
    await analytics.logBeginCheckout(
      value: 123.0,
      currency: 'USD',
      transactionId: 'test tx id',
      numberOfNights: 2,
      numberOfRooms: 3,
      numberOfPassengers: 4,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-17',
      travelClass: 'test travel class',
    );
    await analytics.logCampaignDetails(
      source: 'test source',
      medium: 'test medium',
      campaign: 'test campaign',
      term: 'test term',
      content: 'test content',
      aclid: 'test aclid',
      cp1: 'test cp1',
    );
    await analytics.logEarnVirtualCurrency(
      virtualCurrencyName: 'bitcoin',
      value: 345.66,
    );
    await analytics.logEcommercePurchase(
      currency: 'USD',
      value: 432.45,
      transactionId: 'test tx id',
      tax: 3.45,
      shipping: 5.67,
      coupon: 'test coupon',
      location: 'test location',
      numberOfNights: 3,
      numberOfRooms: 4,
      numberOfPassengers: 5,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-13',
      endDate: '2015-09-14',
      travelClass: 'test travel class',
    );
    await analytics.logGenerateLead(
      currency: 'USD',
      value: 123.45,
    );
    await analytics.logJoinGroup(
      groupId: 'test group id',
    );
    await analytics.logLevelUp(
      level: 5,
      character: 'witch doctor',
    );
    await analytics.logLogin();
    await analytics.logPostScore(
      score: 1000000,
      level: 70,
      character: 'tiefling cleric',
    );
    await analytics.logPresentOffer(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      quantity: 6,
      price: 3.45,
      value: 67.8,
      currency: 'USD',
      itemLocationId: 'test item location id',
    );
    await analytics.logPurchaseRefund(
      currency: 'USD',
      value: 45.67,
      transactionId: 'test tx id',
    );
    await analytics.logSearch(
      searchTerm: 'hotel',
      numberOfNights: 2,
      numberOfRooms: 1,
      numberOfPassengers: 3,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-16',
      travelClass: 'test travel class',
    );
    await analytics.logSelectContent(
      contentType: 'test content type',
      itemId: 'test item id',
    );
    await analytics.logShare(
        contentType: 'test content type',
        itemId: 'test item id',
        method: 'facebook');
    await analytics.logSignUp(
      signUpMethod: 'test sign up method',
    );
    await analytics.logSpendVirtualCurrency(
      itemName: 'test item name',
      virtualCurrencyName: 'bitcoin',
      value: 34,
    );
    await analytics.logTutorialBegin();
    await analytics.logTutorialComplete();
    await analytics.logUnlockAchievement(id: 'all Firebase API covered');
    await analytics.logViewItem(
      itemId: 'test item id',
      itemName: 'test item name',
      itemCategory: 'test item category',
      itemLocationId: 'test item location id',
      price: 3.45,
      quantity: 6,
      currency: 'USD',
      value: 67.8,
      flightNumber: 'test flight number',
      numberOfPassengers: 3,
      numberOfRooms: 1,
      numberOfNights: 2,
      origin: 'test origin',
      destination: 'test destination',
      startDate: '2015-09-14',
      endDate: '2015-09-15',
      searchTerm: 'test search term',
      travelClass: 'test travel class',
    );
    await analytics.logViewItemList(
      itemCategory: 'test item category',
    );
    await analytics.logViewSearchResults(
      searchTerm: 'test search term',
    );
    setMessage('All standard events logged successfully');
  }
  
  Future<void> _testSetCurrentScreen() async {
    await analytics.setCurrentScreen(
      screenName: 'Analytics Demo',
      screenClassOverride: 'AnalyticsDemo',
    );
    setMessage('setCurrentScreen succeeded');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TitleText('Wasteagram'),
        actions: [
          RegularText(totalWaste.toString())
        ],
      ),
      body: 
        StreamBuilder (
            stream: db.orderBy('date', descending: true).snapshots(),
            builder: (content, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.documents.length == 0) {
                  return Center(child: CircularProgressIndicator());
                }
              }
              if(snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    db.orderBy('date');
                    var item = snapshot.data.documents[index];
                    var date = interpretTimestamp(item['date'].millisecondsSinceEpoch);
                    try {
                      totalWaste += item['waste'];
                      //totalWaste += item['date']; //Uncomment to make crash and see the data in crashlytics.
                    }
                    catch (exception) {
                      FlutterCrashlytics().logException(exception, exception.stackTrace);
                      throw new FormatException();
                    }
                    return GestureDetector(
                      onTap: () {
                        _testAllEventTypes();
                        _testSetCurrentScreen();
                        _sendAnalyticsEvent();
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

