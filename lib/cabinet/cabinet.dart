import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenhouseapp/logreg/aclog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Cabinet extends StatefulWidget {
  const Cabinet({Key? key}) : super(key: key);

  @override
  State<Cabinet> createState() => _CabinetState();
}

class _CabinetState extends State<Cabinet> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController greenhController = new TextEditingController();

  String? inputData() {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    return uid;
  }

  //Fluttertoast.showToast(msg: errorMessage!);

  String _datereg = "";
  String _name = "";
  String _email = "";
  String _greenh = "";

  //String _var = "";
  List GreenhousesList = [];

  Future<String> inforacv() async {
    final doc_id = inputData();

    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc('$doc_id').get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      _datereg = data?['datereg'];
      _name = data?['firstName'];
      _email = data?['email'];
      _greenh = data?['greenh'];
    }
    ;
    return _datereg;
  }

  //final Stream _usersStream = FirebaseFirestore.instance.collection('greenhouses').doc('greenhouse1').snapshots();

  Future<void> getGrHlist() async {
    GreenhousesList.clear();
    // Get docs from collection reference
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('greenhouses').get();
    GreenhousesList = querySnapshot.docs.map((doc) => doc.id).toList();
    print(GreenhousesList);
  }

  //Stream<QuerySnapshot> FirebaseFirestore.instance.collection('users').doc().snapshots() as Stream<QuerySnapshot<Object?>>;

  @override
  Widget build(BuildContext context) {
    late String name;
    late String dateRegAc;
    late String email;

    return Scaffold(
        body: Center(
      child: FutureBuilder<String>(
          future: inforacv(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            inforacv();
            getGrHlist();
            name = _name;
            dateRegAc = _datereg;
            email = _email;
            return Container(
              padding: const EdgeInsets.only(
                top: 100.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    child: Column(children: [
                      Text(
                        'User',
                        style: TextStyle(fontSize: 30),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Container(
                        height: 200,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 222, 242, 235),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                height: 40,
                                width: 370,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Name',
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    Text(
                                      "$_name",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                )),
                            Container(height: 40, width: 370, child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Date of registration', style: TextStyle(fontSize: 25),),
                                    Text(dateRegAc, style: TextStyle(fontSize: 20),),],)),
                            Container(height: 40, width: 370, child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                                    Text( 'Email', style: TextStyle(fontSize: 25),),
                                    Text("$email", style: TextStyle(fontSize: 20),),],)),

                          ],
                        ),
                      ),
                      Container(
                        width: 380,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            deleteus(context);
                          },
                          child: Text('Delete account', style: TextStyle(color: Color.fromARGB(255, 223, 48, 42)))),),
                    ],)
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  Container(
                    width: 400,
                    height: 200,
                    child: Column(

                      children: [
                        Text(
                          'Greenhouse',
                          style: TextStyle(fontSize: 30),
                        ),
                        Padding(padding: EdgeInsets.only(top: 10)),

                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .doc(inputData())
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Something went wrong');
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text("Loading");
                              }
                              //where('uid', isEqualTo: inputData()).get('firstName')
                              String _var =
                              (snapshot.data! as DocumentSnapshot).get('greenh');
                              if ((snapshot.data! as DocumentSnapshot)
                                  .get('greenh') == "") {
                                return Container(
                                    height: 120,
                                    width: 400,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 400,
                                          padding:
                                          EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                          decoration: BoxDecoration(
                                            color:
                                            Color.fromARGB(255, 222, 242, 235),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: TextFormField(
                                              autofocus: true,
                                              controller: greenhController,
                                              style: TextStyle(color: Colors.black, fontSize: 25),
                                              onSaved: (value) {
                                                greenhController.text = value!;
                                              },
                                              textInputAction: TextInputAction.done,
                                              decoration: InputDecoration(
                                                hintText: "Greenhouse",
                                                hintStyle: TextStyle(color: Colors.grey, fontSize: 25),
                                                border: InputBorder.none, //borderRadius: BorderRadius.circular(10),

                                              ))
                                        ),
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
                                            await getGrHlist();

                                            if (GreenhousesList.contains(greenhController.text)){
                                            FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(inputData())
                                                .update({'greenh': greenhController.text});}
                                            else {
                                              Fluttertoast.showToast(msg: "This greenhouse isnt exist");
                                            }
                                          },
                                          child: Text('Add greenhouse'),
                                        ),
                                      ],
                                    ));
                              } else {
                                return Container(
                                    height: 120,
                                    width: 400,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 400,
                                          padding:
                                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                          decoration: BoxDecoration(
                                            color:
                                            Color.fromARGB(255, 222, 242, 235),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          child: Text(
                                            (snapshot.data! as DocumentSnapshot).get('greenh'),
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 10)),
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
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(inputData())
                                                .update({'greenh': ''});
                                          },
                                          child: Text('Remove greenhouse'),
                                        ),
                                      ],
                                    ));
                              }

                            }),

                      ],
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30)),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 223, 48, 42),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(400, 50)
                        //Size(400, 50),
                        ),
                    onPressed: () {
                      logout(context);
                    },
                    child: Text('Logout'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 0)),

                ],
              ),
            );
          }),
    ));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Aclog()));
  }

  Future<void> deleteus(BuildContext context) async {
    final User? user = auth.currentUser;
    final uid = user?.uid;
    var collection = FirebaseFirestore.instance.collection('users');
    var docSnapshot = await collection.doc('$uid').delete();

    await user?.delete();
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Aclog()));
  }
}
