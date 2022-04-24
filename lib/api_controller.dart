import 'dart:convert';

import 'package:bed_tracker/location_controller.dart';
import 'package:bed_tracker/model.dart';
import 'package:bed_tracker/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiController {
  static final _searchController = Get.put(SearchController());
  static final _locationController = Get.put(LocationController());

  static Future<List<BaseModel>?> getHospitals() async {
    try {
      final String city = _locationController.city.value.isEmpty
          ? 'Pune'
          : _locationController.city.value;
      List<BaseModel> hospitals = [];
      final res = await http.get(Uri.parse(
          'https://api.covidbedsindia.in/v1/storages/6089822703eef30c1cd05a6e/$city'));
      if (res.statusCode == 200) {
        final resBody = json.decode(res.body);

        for (var hospital in resBody) {
          hospitals.add(BaseModel.fromMap(hospital));
        }
        _searchController.setHospitalList = hospitals;
        _searchController.hasFetchedHospitalData.value = true;
        return hospitals;
      }
    } catch (e) {
      debugPrint("api error $e");
    }
  }
}
