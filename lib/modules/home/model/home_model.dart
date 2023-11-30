class HomeModel{
  String text;
  String description;
  String imagePath;

HomeModel({required this.text, required this.description, required this.imagePath});

String get _text => text;
String get _description => description;
String get _imagePath => imagePath;

}