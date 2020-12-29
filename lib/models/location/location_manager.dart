import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geoCoding;
import 'package:geolocator/geolocator.dart';
import 'package:insta_clone/data_models/location.dart';

class LocationManager{

  Future<Location> getCurrentLocation() async{
    final position =  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    final placeMarks = await geoCoding.placemarkFromCoordinates(position.latitude, position.longitude);
    final placeMark = placeMarks.first;
    return Future.value(convert(placeMark, position.latitude, position.longitude));
  }

  Future<Location> updateLocation(double latitude, double longitude) async{
    final placeMarks = await geoCoding.placemarkFromCoordinates(latitude, longitude);
    final placeMark = placeMarks.first;
    return Future.value(convert(placeMark,latitude, longitude));
  }

  Location convert(geoCoding.Placemark placeMark, double latitude, double longitude) {
    return Location(
      latitude: latitude,
      longtude: longitude,
      country: placeMark.country,
      state: placeMark.administrativeArea,
      city: placeMark.locality,
    );
  }



}

