import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class InF extends StatefulWidget {
  const InF({Key? key}) : super(key: key);

  @override
  State<InF> createState() => _InFState();
}

class _InFState extends State<InF> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  String? inputData() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return uid;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(inputData())
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          String greenHouseName =
              (snapshot.data! as DocumentSnapshot).get('greenh');
          if (greenHouseName == "") {
            return Center(
              child: Text("Enter the greenhouse in cabinet"),
            );
          } else {
            return StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('greenhouses')
                  .doc(greenHouseName)
                  .collection('doings').orderBy('date')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return Text("Events don't exist");
                return Scaffold(
                  body: ListView.builder(
                    itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 30)),
                          Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromARGB(100, 64, 150, 99),
                                        spreadRadius: 0.1,
                                        blurRadius: 2)
                                  ]),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                        (snapshot.data! as QuerySnapshot)
                                            .docs[index]
                                            .get('event'),
                                        style: TextStyle(fontSize: 30)),
                                    subtitle: Text(
                                      DateFormat.yMMMd().add_jm().format(
                                          (snapshot.data! as QuerySnapshot)
                                              .docs[index]
                                              .get('date')
                                              .toDate()),  style: TextStyle(color: Colors.green[800])
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      );
                    },
                  ),
                );
              },
            );
          }
        });
  }

}
