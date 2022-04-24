import 'package:bed_tracker/api_controller.dart';
import 'package:bed_tracker/model.dart';
import 'package:bed_tracker/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final searchController = Get.put(SearchController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (searchController.getHospitalList.isEmpty &&
          !searchController.hasFetchedHospitalData.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Column(
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController.textController,
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  hintText: 'Search Hospital Here',
                ),
                onChanged: searchController.onItemChanged,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: searchController.getHospitalList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                final hospital = searchController.getHospitalList[index];
                return ListTile(
                  title: Text(hospital.hospitalName ?? ''),
                  subtitle: Text(
                    'Oxygen: ${hospital.availableBedsWithOxygen}, ICU: ${hospital.availableIcuBedsWithVentilator}, General ${hospital.availableBedsWithoutOxygen} ',
                  ),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
