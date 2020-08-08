import 'package:wasteagram/exports.dart';
import 'package:path/path.dart' as Path;
import 'package:geolocator/geolocator.dart' as geoLoc;

class CameraScreen extends StatefulWidget {

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  File image;
  String imageURL;
  final formKey = GlobalKey<FormState>();
  int numWasted;
  WasteDataContainer wasteDataContainer = WasteDataContainer();
  Geoflutterfire geo = Geoflutterfire();

  void getImageSelectPhoto() async {
    image = File(await ImagePicker().getImage(
      source: ImageSource.gallery).then((image) => image.path)
    );
    setState(() {
    });
  }

  void getImageTakePhoto() async {
    image = File(await ImagePicker().getImage(
      source: ImageSource.camera).then((image) => image.path)
    );
    setState(() {
    });
  }

  Future uploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance.ref()
    .child('Photo_Uploads/${Path.basename(image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    var downURL = await (await uploadTask.onComplete).ref.getDownloadURL();
    return wasteDataContainer.imgURL = downURL.toString();
  }

  void addPosition() async {
    geoLoc.Position myPos = await 
    geoLoc.Geolocator().getLastKnownPosition(
      desiredAccuracy: geoLoc.LocationAccuracy.high
    );
    wasteDataContainer.position = myPos;
  }

  void addGeoPt() {
    GeoFirePoint temp = geo.point(
    latitude: wasteDataContainer.position.latitude,
    longitude: wasteDataContainer.position.longitude);
    wasteDataContainer.geo = temp;
  }

  void addDateToUpload() {
    wasteDataContainer.date = DateTime.now();
  }
 
  void addToDB() async {
    Firestore.instance.collection('waste').add({
      'waste': wasteDataContainer.numWasted,
      'date': wasteDataContainer.date,
      'location': wasteDataContainer.geo.data,
      'URL': wasteDataContainer.imgURL
    });
  }
  Future sleep2() { 
  return new Future.delayed(const Duration(seconds: 2), () => "2");
  }

  // void addPos() async {
  //   wasteDataContainer.position = await 
  //     geoLoc.Geolocator().getLastKnownPosition(
  //     desiredAccuracy: geoLoc.LocationAccuracy.high
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    if (image == null) {
      // tried to refactor but not working -- return NullImgScaffold(image);
      return Scaffold(
        appBar: AppBar(
          title: TitleText('Wasteagram'),
          centerTitle: true,
        ),
        body: Center(child:
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              RaisedButton(
                color: Colors.green[600],
                child: RegularText('Select a Photo'),
                onPressed: () {
                  getImageSelectPhoto();
                },
              ),
              SizedBox(height: 20),
              RaisedButton(
                color: Colors.green[600],
                child: RegularText('Take a Photo'),
                onPressed: () {
                  getImageTakePhoto();
                },
              ),
            ] 
          ),
        )
      );
    }
    else {
      return Scaffold(
        appBar: AppBar(
          title: TitleText('Wasteagram'),
          centerTitle: true
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(5.0),
                    width: 375,
                    height: 500,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 4,
                      )),
                    child: Image.file(image)
                    ),
                  SizedBox(height: 30),
                  WasteForm(wasteDataContainer),
                  SizedBox(height: 10),
                  RaisedButton(
                    child: RegularText('Post it!'),
                    color: Colors.green[600],
                    onPressed: () async {
                      if(formKey.currentState.validate()) {
                        formKey.currentState.save();
                        Navigator.of(context).pop();
                        wasteDataContainer.position = await //This does work of addPos()
                        geoLoc.Geolocator().getLastKnownPosition( //This does work of addPos()
                          desiredAccuracy: geoLoc.LocationAccuracy.high //This does work of addPos()
                        );
                        uploadFile(); //upload file and get image URL   
                        //addPos(); 
                        addGeoPt(); //set geopoint
                        addDateToUpload(); //add date                       
                      }
                      addToDB(); //adds fields to firestore db
                    },
                  )
                ]
              ),
            ),
          ),
        ),
      );
    }
  }
}