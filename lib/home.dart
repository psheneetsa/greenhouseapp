import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dcdg/dcdg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(padding: EdgeInsets.only(top: 100)),
                  Container(
                    constraints: BoxConstraints.expand(
                      height: 200,
                      width: 1000,
                    ),
                    child: Image.asset('assets/images/output.png'),
                  ),
                  StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('greenhouses')
                          .doc(greenHouseName)
                          .collection('datdan')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        int tempvoz = (snapshot.data! as QuerySnapshot)
                            .docs
                            .last
                            .get('tempvoz');
                        int tempzem = (snapshot.data! as QuerySnapshot)
                            .docs
                            .last
                            .get('tempzem');
                        int vlazvoz = (snapshot.data! as QuerySnapshot)
                            .docs
                            .last
                            .get('vlazvoz');
                        int vlazzem = (snapshot.data! as QuerySnapshot)
                            .docs
                            .last
                            .get('vlazzem');
                        return Container(
                          constraints: BoxConstraints.expand(
                            height: 330,
                            width: 1000,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _infstw('$tempvoz °C', 'Air temperature'),
                                  _infstw('$tempzem °C', 'Ground temperature'),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _infstw('$vlazvoz %', 'Air humidity'),
                                  _infstw('$vlazzem %', 'Ground humidity'),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                  StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('greenhouses')
                          .doc(greenHouseName)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<DocumentSnapshot> snapshot) {
                        bool autofort = (snapshot.data! as DocumentSnapshot)
                            .get('autofortb');
                        bool autopol = (snapshot.data! as DocumentSnapshot)
                            .get('autopolb');
                        bool autosvet = (snapshot.data! as DocumentSnapshot)
                            .get('autoosvb');
                        bool autorec =
                            (snapshot.data! as DocumentSnapshot).get('recvoz');

                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  _infmd('Window leaf', autofort),
                                  Padding(padding: EdgeInsets.only(top: 20)),
                                  _infmd('Recycling', autorec),
                                ],
                              ),
                              Container(
                                width: 7,
                                height: 170,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green[600],
                                ),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _infmd('Watering', autopol),
                                  Padding(padding: EdgeInsets.only(top: 20)),
                                  _infmd('Auto light', autosvet),
                                ],
                              ),
                            ],
                          ),
                        );
                      }),
                ],
              ),
            );
          }
          ;
        });
  }

  Container _infstw(String dan, String dat) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 150,
        width: 200,
      ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: BoxConstraints.expand(
              height: 55,
              width: 140,
            ),
            padding: const EdgeInsets.only(left: 10.0, top: 5.0),
            child: Text(
              dat,
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(
              height: 51,
              width: 200,
            ),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
            child: Text(
              "$dan",
              style: TextStyle(fontSize: 50.0, color: Colors.green[800]),
            ),
          ),
        ],
      ),
    );
  }

  Container _infmd(String mod, bool sost) {
    var colsost = Color.fromARGB(255, 64, 208, 99);
    if (sost) {
      colsost = Color.fromARGB(255, 64, 208, 99);
    } else {
      colsost = Color.fromARGB(255, 223, 48, 42);
    }
    return Container(
      width: 200,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 150,
            child: Text(
              mod,
              style: TextStyle(fontSize: 25),
            ),
          ),
          Container(
            width: 15,
            height: 15,
            decoration: BoxDecoration(color: colsost, shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
