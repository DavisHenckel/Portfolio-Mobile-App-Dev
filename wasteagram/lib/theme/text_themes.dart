import 'package:wasteagram/exports.dart';

class TitleText extends StatelessWidget {

  final String text;

  TitleText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lobster(
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: Colors.white
      ),
    );
  }
}

class RegularText extends StatelessWidget {

  final String text;

  RegularText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSansCondensed(
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white
      ),
    );
  }
}

class LargeText extends StatelessWidget {
  
  final String text;

  LargeText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSansCondensed(
        textStyle: Theme.of(context).textTheme.headline4,
        fontSize: 40,
        color: Colors.white
      ),
    );
  }
}