import 'package:bed_tracker/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LocationController());

    return Container(
      height: Get.height,
      color: Colors.white10,
    );
  }
}
