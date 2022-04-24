import 'package:bed_tracker/first_screen.dart';
import 'package:bed_tracker/hospital_screen.dart';
import 'package:bed_tracker/search_controller.dart';
import 'package:bed_tracker/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'location_controller.dart';
import 'search_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const Text('Hospital Beds in '),
                GestureDetector(
                  child: Text(
                    '${Get.find<LocationController>().city}',
                    style: const TextStyle(
                        color: Colors.amber,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(HospitalList(
                      hospitalName: 'Navale Hospital',
                    ));
                  },
                  icon: const Icon(Icons.local_hospital))
              // TextButton.icon(
              //     onPressed: () {},
              //     icon: const Icon(Icons.local_hospital),
              //     label: const Text("Register"))
            ],
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.local_hospital_outlined), text: "Pune"),
                Tab(icon: Icon(Icons.local_hospital_sharp), text: "Realtime")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              FirstScreen(),
              RealTimeHospitalBeds(),
            ],
          ),
        ),
      ),
    );
  }
}
