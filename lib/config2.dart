class Config{
  Config._inernal();

  static final Config _instance = Config._inernal();

  factory Config() => _instance;

  String apiKey = 'AIzaSyDSc3bK2uacejfepEMiJlrVw9DFC8WVonI';
  String baseUrl ='https://maps.googleapis.com/maps/api/place/details/json?place_id=';
  String currentUrl ='&key=';
}