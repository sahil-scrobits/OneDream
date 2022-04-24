import 'package:bed_tracker/api_controller.dart';
import 'package:bed_tracker/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  RxList<BaseModel> _hospitalList = <BaseModel>[].obs;
  RxList<BaseModel> searchHospitalList = <BaseModel>[].obs;
  TextEditingController textController = TextEditingController();
  RxBool hasFetchedHospitalData = false.obs;
  @override
  void onInit() {
    super.onInit();
    ApiController.getHospitals();
  }

  set setHospitalList(List<BaseModel> hospitalList) {
    
    _hospitalList(hospitalList);
    searchHospitalList(hospitalList);
  }

  List<BaseModel> get getHospitalList => searchHospitalList;

  onItemChanged(String value) {
    searchHospitalList.value = _hospitalList
        .where((hospital) =>
            hospital.hospitalName!.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }
}
