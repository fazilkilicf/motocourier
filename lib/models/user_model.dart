import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserModel {
  late String uid;
  late int type; // 1: courier, 2: customer
  late String name;
  late String surname;
  late String mail;
  late LatLng location;

  UserModel(
      {required this.uid,
      required this.type,
      required this.name,
      required this.surname,
      required this.mail,
      required this.location});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    type = json['type'];
    name = json['name'];
    surname = json['surname'];
    mail = json['mail'];
    // convert location
    if (json['location'] is GeoPoint) {
      GeoPoint geoPoint = json['location'];
      location = LatLng(geoPoint.latitude, geoPoint.longitude);
    } else {
      if (json['location'] != null) {
        GeoPoint geoPoint = GeoPoint(
            json['location']['_latitude'], json['location']['_longitude']);
        location = LatLng(geoPoint.latitude, geoPoint.longitude);
      }
    }
  }

  static Map<String, dynamic> toJson(UserModel userModel) {
    Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = userModel.uid;
    data['type'] = userModel.type;
    data['name'] = userModel.name;
    data['surname'] = userModel.surname;
    data['mail'] = userModel.mail;
    data['location'] =
        GeoPoint(userModel.location.latitude, userModel.location.longitude);
    return data;
  }
}
