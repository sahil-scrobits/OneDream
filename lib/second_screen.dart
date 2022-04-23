import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class RealTimeHospitalBeds extends StatefulWidget {
  @override
  _RealTimeHospitalBedsState createState() => _RealTimeHospitalBedsState();
}

class _RealTimeHospitalBedsState extends State<RealTimeHospitalBeds> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('hospitals').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(data['hospitalName']),
              subtitle: Text(data['oxygenBedsAvailable'].toString()),
            );
          }).toList(),
        );
      },
    );
  }
}
