import 'package:wasteagram/exports.dart';

class CameraScreen extends StatefulWidget {

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  File image;
  final formKey = GlobalKey<FormState>();
  int numWasted;
  WasteDataContainer wasteDataContainer = WasteDataContainer();

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

  @override
  Widget build(BuildContext context) {
    if (image == null) {
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
                      }
                      //Firestore.instance.collection('photos').add({
                      //})
                      Navigator.of(context).pop();
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