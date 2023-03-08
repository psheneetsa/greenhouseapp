import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:intl/intl.dart';

class Stat extends StatefulWidget {
  const Stat({Key? key}) : super(key: key);

  @override
  State<Stat> createState() => _StatState();
}

class _StatState extends State<Stat> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;

    String? inputData() {
      final User? user = auth.currentUser;
      final uid = user?.uid;
      return uid;
    }

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
                    .collection('datdan')
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  List<_ChartData> airtemp = [];
                  List<_ChartData> groundtemp = [];
                  List<_ChartData> airhum = [];
                  List<_ChartData> groundhum = [];
                  int lendocs = (snapshot.data! as QuerySnapshot).size;
                  for (int i = lendocs - 24; i < lendocs; i++) {
                    airtemp.add(_ChartData(
                        x: DateTime.fromMillisecondsSinceEpoch(
                            (snapshot.data! as QuerySnapshot)
                                .docs[i]
                                .get('datehour')
                                .millisecondsSinceEpoch),
                        y: (snapshot.data! as QuerySnapshot)
                            .docs[i]
                            .get('tempvoz')));
                    groundtemp.add(_ChartData(
                        x: DateTime.fromMillisecondsSinceEpoch(
                            (snapshot.data! as QuerySnapshot)
                                .docs[i]
                                .get('datehour')
                                .millisecondsSinceEpoch),
                        y: (snapshot.data! as QuerySnapshot)
                            .docs[i]
                            .get('tempzem')));
                    airhum.add(_ChartData(
                        x: DateTime.fromMillisecondsSinceEpoch(
                            (snapshot.data! as QuerySnapshot)
                                .docs[i]
                                .get('datehour')
                                .millisecondsSinceEpoch),
                        y: (snapshot.data! as QuerySnapshot)
                            .docs[i]
                            .get('vlazvoz')));
                    groundhum.add(_ChartData(
                        x: DateTime.fromMillisecondsSinceEpoch(
                            (snapshot.data! as QuerySnapshot)
                                .docs[i]
                                .get('datehour')
                                .millisecondsSinceEpoch),
                        y: (snapshot.data! as QuerySnapshot)
                            .docs[i]
                            .get('vlazzem')));
                  }

                  return Center(
                    child: Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 60)),
                        Container(
                            height: 200,
                            child: Column(
                              children: [
                                Text('Air temperature'),
                                Container(
                                  height: 180,
                                  child: SfCartesianChart(
                                    plotAreaBorderWidth: 0,
                                    primaryXAxis: DateTimeAxis(),
                                    primaryYAxis:
                                        NumericAxis(labelFormat: '{value}°C'),
                                    series: <ChartSeries<_ChartData, DateTime>>[
                                      LineSeries<_ChartData, DateTime>(
                                          color: Colors.green,
                                          dataSource: airtemp,
                                          xValueMapper: (_ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (_ChartData data, _) =>
                                              data.y),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            height: 200,

                            child: Column(
                              children: [
                                Text('Ground temperature'),
                                Container(
                                  height: 180,
                                  child: SfCartesianChart(
                                    plotAreaBorderWidth: 0,
                                    primaryXAxis: DateTimeAxis(),
                                    primaryYAxis:
                                        NumericAxis(labelFormat: '{value}°C'),
                                    series: <ChartSeries<_ChartData, DateTime>>[
                                      LineSeries<_ChartData, DateTime>(
                                          color: Colors.green,
                                          dataSource: groundtemp,
                                          xValueMapper: (_ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (_ChartData data, _) =>
                                              data.y),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            height: 200,
                            child: Column(
                              children: [
                                Text('Air humidity'),
                                Container(
                                  height: 180,
                                  child: SfCartesianChart(
                                    plotAreaBorderWidth: 0,
                                    primaryXAxis: DateTimeAxis(),
                                    primaryYAxis:
                                        NumericAxis(labelFormat: '{value}%'),
                                    series: <ChartSeries<_ChartData, DateTime>>[
                                      LineSeries<_ChartData, DateTime>(
                                          color: Colors.green,
                                          dataSource: airhum,
                                          xValueMapper: (_ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (_ChartData data, _) =>
                                              data.y),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            height: 200,
                            child: Column(
                              children: [
                                Text('Ground humidity'),
                                Container(
                                  height: 180,
                                  child: SfCartesianChart(
                                    plotAreaBorderWidth: 0,
                                    primaryXAxis: DateTimeAxis(),
                                    primaryYAxis:
                                        NumericAxis(labelFormat: '{value}%'),
                                    series: <ChartSeries<_ChartData, DateTime>>[
                                      LineSeries<_ChartData, DateTime>(
                                          color: Colors.green,
                                          dataSource: groundhum,
                                          xValueMapper: (_ChartData data, _) =>
                                              data.x,
                                          yValueMapper: (_ChartData data, _) =>
                                              data.y),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  );
                });
          }
        });
  }
}

class _ChartData {
  _ChartData({this.x, this.y});

  final DateTime? x;
  final int? y;
}
