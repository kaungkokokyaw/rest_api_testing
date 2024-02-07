class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationStreet street;
  final LocationCoordinate coordinate;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.street,
    required this.coordinate,
  });

  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final coordinates = LocationCoordinate.fromMap(json['coordinates']);
    final street = LocationStreet.fromMap(json['street']);

    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      street: street,
      coordinate: coordinates,
    );
  }
}

class LocationStreet {
  final int number;
  final String name;

  LocationStreet({
    required this.number,
    required this.name,
  });

  factory LocationStreet.fromMap(Map<String, dynamic> json) {
    return LocationStreet(
      number: json['number'],
      name: json['name'],
    );
  }
}

class LocationCoordinate {
  final String latitude;
  final String longitude;

  LocationCoordinate({
    required this.latitude,
    required this.longitude,
  });

  factory LocationCoordinate.fromMap(Map<String, dynamic> json) {
    return LocationCoordinate(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
