import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Modules extends StatefulWidget {
  const Modules({Key? key}) : super(key: key);

  @override
  State<Modules> createState() => _ModulesState();
}

class _ModulesState extends State<Modules> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<bool> infogr(greenhn) async {
    //String greenhav = FirebaseFirestore.instance.collection('users').doc(inputData()).get('greenh');
    final doc_id = greenhn;
    var collection = FirebaseFirestore.instance.collection('greenhouses');
    var docSnapshot = await collection.doc('$doc_id').get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      _slvv = data?['autofortz'].toDouble();
      _autof = data?['autofortb'];
      _recv = data?['recvoz'];
      _aosv = data?['autoosvb'];
      _slosv= data?['autoosvz'].toDouble();
      _autop= data?['autopolb'];
      _slvz= data?['autopolz'].toDouble();
      _znvv = _slvv.ceil();
      _znvz = _slvz.ceil();
      _znosv = _slosv.ceil();
      print(_slosv);

      }

    return _autof;
  }


  String? inputData() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return uid;
  }
  bool _autop = true;
  bool _autof = true;
  bool _recv = true;
  bool _aosv = true;
  double _slvv = 0;
  double _slvz = 0;
  double _slosv = 0;
  int _znvv = 0;
  int _znvz = 0;
  int _znosv = 0;

  int i = 0;

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

          String greenHouseName = (snapshot.data! as DocumentSnapshot).get('greenh');
          if ((snapshot.data! as DocumentSnapshot).get('greenh') == "") {

            return Center(
              child: Text("Enter the greenhouse in cabinet"),
            );
          } else {
           if (i == 0){infogr(greenHouseName);
            ++i;}
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(padding: EdgeInsets.only(top: 100)),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      boxShadow: [ BoxShadow(
              color: Color.fromARGB(100, 64, 150, 99),
              spreadRadius: 0.1,
              blurRadius: 2
              )],

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: SwitchListTile(
                        title: Text(
                          'Air recirculation',
                          style: TextStyle(fontSize: 25),
                        ),
                        activeColor: Color.fromARGB(255, 64, 208, 99),
                        activeTrackColor: Color.fromARGB(100, 64, 208, 99),
                        inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
                        inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
                        value: _recv,
                        onChanged: (bool value) {
                          setState(() {
                            _recv = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                              boxShadow: [ BoxShadow(
                                  color: Color.fromARGB(100, 64, 150, 99),
                                  spreadRadius: 0.1,
                                  blurRadius: 2
                              )],

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: SwitchListTile(
                              title: Text(
                                'Automatic watering',
                                style: TextStyle(fontSize: 25),
                              ),
                              activeColor: Color.fromARGB(255, 64, 208, 99),
                              activeTrackColor: Color.fromARGB(100, 64, 208, 99),
                              inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
                              inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
                              value: _autop,
                              onChanged: (bool value) {
                                setState(() {
                                  _autop = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [

                              Slider(
                                max: 100,
                                divisions: 100,
                                activeColor: Color.fromARGB(255, 64, 208, 99),
                                inactiveColor: Color.fromARGB(100, 64, 208, 99),
                                value: _slvz,
                                onChanged: (double value) {
                                  setState(() {
                                    _slvz = value;
                                    _znvz = _slvz.ceil();
                                  });
                                },
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Text(
                                  'up to $_znvz %',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                              boxShadow: [ BoxShadow(
                                  color: Color.fromARGB(100, 64, 150, 99),
                                  spreadRadius: 0.1,
                                  blurRadius: 2
                              )],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: SwitchListTile(
                              title: Text(
                                'Automatic ventilation',
                                style: TextStyle(fontSize: 25),
                              ),
                              activeColor: Color.fromARGB(255, 64, 208, 99),
                              activeTrackColor: Color.fromARGB(100, 64, 208, 99),
                              inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
                              inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
                              value: _autof,
                              onChanged: (bool value) {
                                setState(() {
                                  _autof = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Slider(
                                max: 100,
                                divisions: 100,
                                activeColor: Color.fromARGB(255, 64, 208, 99),
                                inactiveColor: Color.fromARGB(100, 64, 208, 99),
                                value: _slvv,
                                onChanged: (double value) {
                                  setState(() {
                                    _slvv = value;
                                    _znvv = _slvv.ceil();
                                  });
                                },
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Text(
                                  'up to $_znvv %',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                              boxShadow: [ BoxShadow(
                                  color: Color.fromARGB(100, 64, 150, 99),
                                  spreadRadius: 0.1,
                                  blurRadius: 2
                              )],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: SwitchListTile(
                              title: Text(
                                'Automatic lighting',
                                style: TextStyle(fontSize: 25),
                              ),
                              activeColor: Color.fromARGB(255, 64, 208, 99),
                              activeTrackColor: Color.fromARGB(100, 64, 208, 99),
                              inactiveTrackColor: Color.fromARGB(100, 223, 48, 42),
                              inactiveThumbColor: Color.fromARGB(255, 223, 48, 42),
                              value: _aosv,
                              onChanged: (bool value) {
                                setState(() {
                                  _aosv = value;
                                });
                              },
                            ),
                          ),
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Slider(
                                max: 100,
                                divisions: 100,
                                activeColor: Color.fromARGB(255, 64, 208, 99),
                                inactiveColor: Color.fromARGB(100, 64, 208, 99),
                                value: _slosv,
                                onChanged: (double value) {
                                  setState(() {
                                    _slosv = value;
                                    _znosv = _slosv.ceil();
                                  });
                                },
                              ),
                              Container(
                                padding: const EdgeInsets.only(right: 30.0),
                                child: Text(
                                  'up to $_znosv %',
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Color.fromARGB(255, 12, 147, 89),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                            minimumSize: Size(400, 50),
                            //Size(400, 50),
                          ),
                          onPressed: () async {
                            FirebaseFirestore.instance.collection('greenhouses').doc(greenHouseName).update(
                                {'autofortz': _znvv,
                                  'autofortb': _autof,
                                  'recvoz': _recv,
                                  'autoosvb': _aosv,
                                  'autoosvz': _znosv,
                                  'autopolb': _autop,
                                  'autopolz': _znvz
                                }


                            );
                            Fluttertoast.showToast(msg: "Data update");
                          },
                          child: Text('Update variables'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          };
        });
  }
}
