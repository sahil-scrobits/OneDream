import 'package:bed_tracker/first_screen.dart';
import 'package:bed_tracker/second_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Hospital Beds Nearby'),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.local_hospital_outlined), text: "Pune"),
                Tab(icon: Icon(Icons.local_hospital_sharp), text: "Realtime")
              ],
            ),
          ),
          body:  TabBarView(
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
