import 'package:flutter/material.dart';

class Location{
  final double latitude;
  final double longtude;
  final String country;
  final String state;
  final String city;

//<editor-fold desc="Data Methods" defaultstate="collapsed">

  const Location({
    @required this.latitude,
    @required this.longtude,
    @required this.country,
    @required this.state,
    @required this.city,
  });

  Location copyWith({
    double latitude,
    double longtude,
    String country,
    String state,
    String city,
  }) {
    if ((latitude == null || identical(latitude, this.latitude)) &&
        (longtude == null || identical(longtude, this.longtude)) &&
        (country == null || identical(country, this.country)) &&
        (state == null || identical(state, this.state)) &&
        (city == null || identical(city, this.city))) {
      return this;
    }

    return new Location(
      latitude: latitude ?? this.latitude,
      longtude: longtude ?? this.longtude,
      country: country ?? this.country,
      state: state ?? this.state,
      city: city ?? this.city,
    );
  }

  @override
  String toString() {
    return 'Location{latitude: $latitude, longtude: $longtude, country: $country, state: $state, city: $city}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longtude == other.longtude &&
          country == other.country &&
          state == other.state &&
          city == other.city);

  @override
  int get hashCode =>
      latitude.hashCode ^
      longtude.hashCode ^
      country.hashCode ^
      state.hashCode ^
      city.hashCode;

  factory Location.fromMap(Map<String, dynamic> map) {
    return new Location(
      latitude: map['latitude'] as double,
      longtude: map['longtude'] as double,
      country: map['country'] as String,
      state: map['state'] as String,
      city: map['city'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'latitude': this.latitude,
      'longtude': this.longtude,
      'country': this.country,
      'state': this.state,
      'city': this.city,
    } as Map<String, dynamic>;
  }

//</editor-fold>

}