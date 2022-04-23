import 'dart:convert';

import 'package:bed_tracker/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiController {
  static Future<List<BaseModel>?> getHospitals() async {
    try {
      List<BaseModel> hospitals = [];
      final res = await http.get(Uri.parse(
          'https://api.covidbedsindia.in/v1/storages/6089822703eef30c1cd05a6e/Pune'));
      if (res.statusCode == 200) {
        final resBody = json.decode(res.body);

        for (var hospital in resBody) {
          hospitals.add(BaseModel.fromJson(hospital));
        }
        return hospitals;
      }
    } catch (e) {
      debugPrint("api error $e");
    }
  }
}
