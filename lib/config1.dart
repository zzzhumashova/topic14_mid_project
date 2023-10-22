class Config{
  Config._inernal();

  static final Config _instance = Config._inernal();

  factory Config() => _instance;

  String apiKey = 'AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI';
// https://maps.googleapis.com/maps/api/place/autocomplete/json?input=Man&language=pt_BR&types=%28cities%29&key=AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI
  String baseUrl ='https://maps.googleapis.com/maps/api/place/autocomplete/json?input=';
  String currentUrl ='&language=en&types=%28cities%29&key=';
}