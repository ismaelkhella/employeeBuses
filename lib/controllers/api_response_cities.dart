import 'package:employe_buses/models/city.dart';

class ApiResponseCities {
  late bool result;
 late String message;
 late List<City> data;



  ApiResponseCities.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <City>[];
      json['data'].forEach((v) {
        data.add(City.fromJson(v));
      });
    }
  }}