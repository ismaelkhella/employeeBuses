import 'dart:convert';
import 'package:employe_buses/controllers/api_response_cities.dart';
import 'package:employe_buses/models/city.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import '../helper/helper.dart';
import 'api_setting.dart';

class AuthApiController with Helper {

  Future<List<City>> getCities(BuildContext context) async {
    var url = Uri.parse(ApiSettings.cities);
    var response = await http.get(url, headers: {'x-api-key': '12345'});
    if (response.statusCode == 200) {
      showSnackBar(
        Context: context,
        message: response.headers.toString(),
      );
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      var apiBaseResponse = ApiResponseCities.fromJson(jsonResponse);
      return apiBaseResponse.data;
    }

    return [];
  }
}
