import 'package:wasteagram/exports.dart';

class CameraScreen extends StatefulWidget {

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  File image;

  void getImage() async {
    image = File(await ImagePicker().getImage(
      source: ImageSource.gallery).then((image) => image.path)
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
        body: Center(
          child: RaisedButton(
            child: RegularText('Select a Photo'),
            onPressed: () {
              getImage();
            },
          ), 
        ),
      );
    }
    else {
      return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(image),
            SizedBox(height: 40),
            RaisedButton(
              child: RegularText('Post it!'),
              onPressed: () {

              },
            )
          ]
        ),
      );
    }
  }
}