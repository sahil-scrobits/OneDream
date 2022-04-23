import 'package:bed_tracker/api_controller.dart';
import 'package:bed_tracker/model.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
 const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BaseModel>?>(
        future: ApiController.getHospitals(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              final hospital = snapshot.data![index];
              return ListTile(
                title: Text(hospital.hospitalName ?? ''),
                subtitle:
                    Text('Oxygen Beds avaliable ${hospital.availableBedsWithOxygen}'),
              );
            },
          );
        });
  }
}
