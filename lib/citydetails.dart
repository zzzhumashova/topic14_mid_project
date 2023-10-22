class CityDetails {
  final dynamic types;
  final dynamic icon;
  final dynamic website;

  CityDetails({
    required this.types,
    required this.icon,
    required this.website,
  });

  factory CityDetails.fromJson(Map<String, dynamic> json) {
    final types = json['result'];
    return CityDetails(
      types: json['types'],
      icon: json['icon'],
      website: json['website'],
    );
  }


 @override
  String toString() => ''' 
    Types: $types
    Icon: $icon
    Website: $website
    ''';
}