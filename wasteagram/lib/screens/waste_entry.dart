import 'package:wasteagram/exports.dart';

class WasteEntry extends StatelessWidget {

  final String dateTime;
  final Map geoPoint;
  final String url;
  final int numWaste;

  WasteEntry(this.dateTime, this.geoPoint, this.url, this.numWaste);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TitleText('Wasteagram'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              SizedBox(height: 20),
              Center(child: LargeText('$dateTime')),
              SizedBox(height: 20),
              Container(
                height: 400,
                width: 300,
                child: Image.network(
                  url,
                  loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }
                )
              ),
              SizedBox(height: 20),
              Center(child: LargeText('$numWaste item(s) wasted')),
              SizedBox(height: 60),
              Center(
                child: Text(
                  'Location: (' + geoPoint['geopoint'].latitude.toString() + ', '
                  + geoPoint['geopoint'].longitude.toString() + ')',
                  style: GoogleFonts.openSansCondensed(
                    textStyle: Theme.of(context).textTheme.headline4,
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              )
            ]
          )
        )
      ),
    );
  }
}