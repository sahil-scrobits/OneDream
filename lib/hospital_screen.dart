import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counter/counter.dart';
import 'package:flutter/material.dart';

class HospitalList extends StatefulWidget {
  final String hospitalName;
  HospitalList({required this.hospitalName});
  @override
  _HospitalListState createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> {
  late final Stream<DocumentSnapshot> _usersStream;
  late DocumentReference hospitalData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usersStream = FirebaseFirestore.instance
        .collection('hospitals')
        .doc(widget.hospitalName)
        .snapshots();
    hospitalData = FirebaseFirestore.instance
        .collection('hospitals')
        .doc(widget.hospitalName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.hospitalName} Data")),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _usersStream,
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting &&
              snapshot.data == null) {
            return Text("Loading");
          }

          final data = snapshot.data?.data() as Map<String, dynamic>;
          debugPrint("hospital Data $data");

          return Column(
            children: [
              ListTile(
                title: const Text("General"),
                trailing: Counter(
                  initial: data['generalBed'],
                  min: 0,
                  max: 10,
                  step: 1,
                  onValueChanged: (num number) {
                    hospitalData.update({
                      'generalBed': number,
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("Oxygen Bed"),
                trailing: Counter(
                  initial: data['oxygenBed'],
                  min: 0,
                  max: 10,
                  step: 1,
                  onValueChanged: (num number) {
                    hospitalData.update({
                      'oxygenBed': number,
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text("ICU bed"),
                trailing: Counter(
                  initial: data['icuBed'],
                  min: 0,
                  max: 10,
                  step: 1,
                  onValueChanged: (num number) {
                    hospitalData.update({
                      'icuBed': number,
                    });
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
