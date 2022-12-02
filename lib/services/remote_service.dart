import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:kenteken/models/car.dart';
import 'package:kenteken/models/car_image.dart';

class RemoteService {
  Future<List<Car>?> getCars(String options) async {
    Client client = Client();
    Uri uri =
        Uri.parse('https://opendata.rdw.nl/resource/m9d7-ebf2.json${options}');
    var response = await client.get(uri);
    //if response if around 200 load it, else throw error
    if (response.statusCode < 300 && response.statusCode >= 200) {
      List<Car> carList;
      //fill list with car's
      carList = (jsonDecode(response.body) as List)
          .map((e) => Car.fromJson(e))
          .toList();
      return carList;
    } else {
      if (response.statusCode == 400) {
        return List.empty();
      }
      throw Exception("Probleem met ophalen van data, is de API wel online?");
    }
  }

  Future<Photos?> getImage(String options) async {
    Client client = Client();
    Uri uri = Uri.parse(
        'https://api.pexels.com/v1/search?query=${options}&per_page=10');
    var response = await client.get(uri, headers: {
      'Authorization':
          '563492ad6f91700001000001536034ed63cc46deb5ca07609839aa59'
    });

    if (response.statusCode < 300 && response.statusCode >= 200) {
      Photos photoList;
      //fill list with photos
      photoList = Photos.fromJson(jsonDecode(response.body));

      return photoList;
    } else {
      if (response.statusCode == 400) {
        return null;
      }
      throw Exception("Probleem met ophalen van data, is de API wel online?");
    }
  }
}
